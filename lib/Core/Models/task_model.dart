import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String title;
  final String id;
  final bool done;
  final Timestamp dueDate;
  final Timestamp createDate;
  final String description;

  Task(this.title, this.description, this.id, this.done, this.dueDate,
      this.createDate);

  Task.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        done = snapshot['done'],
        dueDate = snapshot['due'],
        createDate = snapshot['create_at'],
        description = snapshot['description'];
}
