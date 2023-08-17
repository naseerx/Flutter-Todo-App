import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haztech_task/Core/enums/task_sorting.dart';
import 'package:haztech_task/UI/Screens/Authentication/login_screen.dart';
import 'package:haztech_task/UI/custom_widgets/custom_snackbars.dart';
import 'package:ndialog/ndialog.dart';
import 'package:get/get.dart';

import '../Models/task_model.dart';
import '../enums/task_filter.dart';
import '../services/local_notification.dart';

class TaskProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? username;
  late Stream<List<Task>> _taskStream;
  TaskFilter currentFilter = TaskFilter.all;
  TaskSortOption currentOption = TaskSortOption.none;

  Stream<List<Task>> get taskStream => _taskStream;
  DateTime? selectedDueDate;

  TaskProvider() {
    getUserName();
    fetchTasks();
  }

  Future<void> addTask(
      String title, String description, BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context,
        title: const Text('Loading'), message: const Text('Please wait'));
    try {
      dialog.show();
      await _firestore.collection('tasks').add({
        'title': title,
        'description': description ?? '',
        'uid': user?.uid,
        'done': false,
        'create_at': DateTime.now(),
        'due': selectedDueDate,
      });
      // DateTime taskAddedTime = DateTime.now();
      // DateTime notificationTime = taskAddedTime.add(const Duration(minutes: 1));
      print(selectedDueDate);
      await LocalNotificationService().scheduleNotification(
        id: 1,
        title: 'Task Reminder',
        body: 'Don\'t forget to complete your task: Alfred Local Notification',
        scheduledNotificationDateTime: selectedDueDate!,
      );

      dialog.dismiss();
      Get.back();
      CustomSnackBar.showSuccess('Task Added Successfully');
    } catch (e) {
      CustomSnackBar.showError('Error adding task: $e');
      dialog.dismiss();
      rethrow;
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      print('Error deleting task: $e');
      rethrow;
    }
  }

  DateTime convertTimestampToDateTime(Timestamp timestamp) {
    return timestamp.toDate();
  }

  void updateTaskStatus(String taskId, bool newStatus) {
    _firestore
        .collection('tasks')
        .doc(taskId)
        .update({'done': newStatus}).then((value) {
      print('Task status updated successfully');
    }).catchError((error) {
      print('Failed to update task status: $error');
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final initialDate = selectedDueDate ?? DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDueDate = pickedDate;
      notifyListeners();
    }
  }

  Future<void> getUserName() async {
    try {
      final user = this.user;
      if (user != null) {
        final DocumentSnapshot snapshot =
            await _firestore.collection('users').doc(user.uid).get();
        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          final name = data['name'];
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          print(name);
          username = name;
          notifyListeners();
        }
      }
    } catch (e) {
      print('Error getting user name: $e');
      rethrow;
    }
  }

  void updateUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }

  void updateUserData() {
    print(username);
    final userCollection = FirebaseFirestore.instance.collection('users');
    final userDoc = userCollection.doc(user?.uid);

    userDoc.update({'name': username}).then((_) {
      CustomSnackBar.showSuccess('Profile Update Successfully');
      notifyListeners();
    }).catchError((error) {
      CustomSnackBar.showError('Error updating user data: $error');
    });
  }

  void logout() async {
    try {
      await _auth.signOut();
      CustomSnackBar.showSuccess('Logout successfully');
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }

  void fetchTasks() {
    Query query = _firestore.collection('tasks');
    print('>>>>>>>>>>>>>>>>>>');
    print(TaskFilter);
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserUid != null) {
      query = query.where('uid', isEqualTo: currentUserUid);
    } else {
      return;
    }
    switch (currentFilter) {
      case TaskFilter.done:
        query = _firestore
            .collection('tasks')
            .where('done', isEqualTo: true)
            .where('uid', isEqualTo: currentUserUid);
        break;
      case TaskFilter.pending:
        query = _firestore
            .collection('tasks')
            .where('done', isEqualTo: false)
            .where('uid', isEqualTo: currentUserUid);
        break;
      default:
    }
    if (currentOption == TaskSortOption.dueDate) {
      query = _firestore.collection('tasks').orderBy('due');
    } else if (currentOption == TaskSortOption.creationDate) {
      query = _firestore.collection('tasks').orderBy('create_at');
    }
    _taskStream = query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList());
  }

  void updateFilter(TaskFilter newFilter) {
    if (currentFilter != newFilter) {
      currentFilter = newFilter;
      fetchTasks();
      notifyListeners();
    }
  }

  void updateSortOption(TaskSortOption sortOption) {
    if (currentOption != sortOption) {
      currentOption = sortOption;
      fetchTasks();
      notifyListeners();
    }
  }
}
