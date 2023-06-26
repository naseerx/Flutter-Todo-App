import 'package:flutter/material.dart';
import 'package:haztech_task/Core/providers/task_provider.dart';
import 'package:haztech_task/UI/custom_widgets/custom_buttons.dart';
import 'package:haztech_task/UI/custom_widgets/custom_snackbars.dart';
import 'package:haztech_task/UI/custom_widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/add.png'),
                ),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.title,
                    color: kPrimaryColor,
                  ),
                  controller: titleController,
                  hintText: 'Title',
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  prefixIcon: const Icon(
                    Icons.description,
                    color: kPrimaryColor,
                  ),
                  controller: descriptionController,
                  hintText: 'Description',
                ),
                const SizedBox(height: 40.0),
                MyButtonLong(
                    name: 'Add Task',
                    onTap: () {
                      if (titleController.text.isEmpty) {
                        return CustomSnackBar.showError(
                            'Please provide title');
                      }
                      taskProvider.addTask(titleController.text,
                          descriptionController.text, context);
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
