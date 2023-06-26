
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String title;
  final String id;
  final bool done;
  final String description;

  Task(this.title, this.description, this.id, this.done);

  Task.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        done = snapshot['done'],
        description = snapshot['description'];
}