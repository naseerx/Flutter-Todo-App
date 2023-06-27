import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:haztech_task/UI/Screens/Task%20screeens/tasks_screen.dart';
import 'package:haztech_task/UI/custom_widgets/custom_snackbars.dart';
import 'package:ndialog/ndialog.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context,
        title: const Text('Loading'), message: const Text('Please wait'));
    try {
      dialog.show();
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomSnackBar.showSuccess('Login successfully');
      dialog.dismiss();
      Get.offAll(() => const TasksScreen());
    } catch (e) {
      CustomSnackBar.showError('Error signing in: $e');
      dialog.dismiss();

      rethrow;
    }
  }
  Future<void> sendPasswordResetEmail(String email, BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context,
        title: const Text('Loading'), message: const Text('Please wait'));
    try {
      dialog.show();
      await _auth.sendPasswordResetEmail(email: email);
      CustomSnackBar.showSuccess('Password reset email sent');
      dialog.dismiss();
    } catch (e) {
      CustomSnackBar.showError('Error sending password reset email: $e');
      dialog.dismiss();
      rethrow;
    }
  }
}
