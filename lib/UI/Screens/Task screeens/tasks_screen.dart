import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haztech_task/Core/Constants/colors.dart';
import 'package:haztech_task/Core/enums/task_sorting.dart';
import 'package:haztech_task/Core/notification_services.dart';
import 'package:haztech_task/Core/providers/task_provider.dart';
import 'package:haztech_task/UI/Screens/Task%20screeens/add_task_screen.dart';
import 'package:haztech_task/UI/custom_widgets/custom_snackbars.dart';
import 'package:haztech_task/UI/custom_widgets/task_block.dart';
import 'package:provider/provider.dart';

import '../../../Core/enums/task_filter.dart';
import '../../custom_widgets/delete_dialod.dart';
import '../../custom_widgets/setting_bottom_sheet.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value) {
      print('Device token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(width: 10),
                  const Text('Hello '),
                  taskProvider.username == null
                      ? const CircularProgressIndicator()
                      : Text(
                          taskProvider.username.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kBlack),
                        ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          SettingsBottomSheet(
                            username: taskProvider.username.toString(),
                            onUsernameChanged: (value) {
                              taskProvider.updateUsername(value);
                            },
                            onUpdatePressed: () {
                              taskProvider.updateUserData();
                              Get.back();
                            },
                            onLogoutPressed: () {
                              taskProvider.logout();
                              Get.back();
                            },
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                      icon: const Icon(Icons.settings)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'ToDos',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Filter By',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kBlack),
                  ),
                  Spacer(),
                  Text(
                    'Sorted By',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kBlack),
                  ),
                ],
              ),
              Row(
                children: [
                  DropdownButton<TaskFilter>(
                    value: taskProvider.currentFilter,
                    onChanged: (TaskFilter? newValue) {
                      if (newValue != null) {
                        taskProvider.updateFilter(newValue);
                        taskProvider.updateSortOption(TaskSortOption.none);
                      }
                    },
                    items: TaskFilter.values.map((TaskFilter filter) {
                      String filterText = '';
                      if (filter == TaskFilter.all) {
                        filterText = 'All Tasks';
                      } else if (filter == TaskFilter.done) {
                        filterText = 'Done';
                      } else if (filter == TaskFilter.pending) {
                        filterText = 'Pending';
                      }
                      return DropdownMenuItem<TaskFilter>(
                        value: filter,
                        child: Text(filterText),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  DropdownButton<TaskSortOption>(
                    value: taskProvider.currentOption,
                    onChanged: (TaskSortOption? newValue) {
                      if (newValue != null) {
                        taskProvider.updateSortOption(newValue);
                        taskProvider.updateFilter(TaskFilter.all);
                      }
                    },
                    items: TaskSortOption.values.map((TaskSortOption filter) {
                      String optionText = '';
                      if (filter == TaskSortOption.none) {
                        optionText = 'None';
                      } else if (filter == TaskSortOption.dueDate) {
                        optionText = 'Due date';
                      } else if (filter == TaskSortOption.creationDate) {
                        optionText = 'Create Date';
                      }
                      return DropdownMenuItem<TaskSortOption>(
                        value: filter,
                        child: Text(optionText),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: taskProvider.taskStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final tasks = snapshot.data;

                      return ListView.builder(
                        itemCount: tasks?.length,
                        itemBuilder: (context, index) {
                          final task = tasks![index];
                          return Dismissible(
                            key: Key(task.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (direction) async {
                              taskProvider.deleteTask(task.id);
                              CustomSnackBar.showSuccess(
                                  'Task Deleted Successfully');
                            },
                            child: TaskBlock(
                              title: task.title,
                              description: task.description,
                              onDelete: () async {
                                final confirmed = await CustomDialog
                                    .showDeleteConfirmationDialog(context);
                                if (confirmed != null && confirmed) {
                                  taskProvider.deleteTask(task.id);
                                  CustomSnackBar.showSuccess(
                                      'Task Deleted Successfully');
                                }
                              },
                              done: task.done,
                              onDone: () {
                                taskProvider.updateTaskStatus(
                                    task.id, !task.done);
                              },
                              dueDate: task.dueDate,
                              createDate: task.createDate,
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddTaskScreen());
            },
            child: const Icon(Icons.add)),
      );
    });
  }
}
