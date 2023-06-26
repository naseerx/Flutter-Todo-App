import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haztech_task/UI/Screens/Task%20screeens/tasks_screen.dart';
import 'package:ndialog/ndialog.dart';

import '../../UI/custom_widgets/custom_snackbars.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> signUpWithEmailAndPassword(
      String name, String email, String password, BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context,
        title: const Text('Loading'), message: const Text('Please wait'));
    try {
      dialog.show();
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      storeUserData(userId: user!.uid, name: name, email: email);
      CustomSnackBar.showSuccess('SignUp Successfully');
      dialog.dismiss();
      Get.offAll(() => const TasksScreen());
    } catch (e) {
      CustomSnackBar.showError('SignUp Failed!');
      dialog.dismiss();
      if (kDebugMode) {
        print('Error signing up: $e');
      }
      rethrow;
    }
  }

  Future<void> storeUserData(
      {required String userId,
      required String name,
      required String email}) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        'uid': userId,
        'name': name,
      });
    } catch (e) {
      CustomSnackBar.showError('Error storing user data: $e');

      rethrow;
    }
  }
}
