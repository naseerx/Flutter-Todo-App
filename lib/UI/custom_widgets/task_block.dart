import 'package:flutter/material.dart';

import '../../Core/Constants/colors.dart';

class TaskBlock extends StatelessWidget {
  final String title;
  final bool done;
  final VoidCallback onDelete;
  final VoidCallback onDone;
  final String description;

  const TaskBlock(
      {super.key,
      required this.title,
      required this.description,
      required this.onDelete,
      required this.done,
      required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(15), // Set the border radius
      ),
      child: ListTile(
        leading: IconButton(
          color: kPrimaryColor,
          onPressed: onDone,
          icon: Icon(done ? Icons.check_box : Icons.check_box_outline_blank),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
