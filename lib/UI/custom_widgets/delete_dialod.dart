import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<bool?> showDeleteConfirmationDialog(
      BuildContext context) async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              Get.back(result: true);
            },
          ),
        ],
      ),
    );
  }
}
