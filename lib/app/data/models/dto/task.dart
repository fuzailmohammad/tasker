import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final String expectedDuration;
  late bool isComplete;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.expectedDuration,
    this.isComplete = false, // Initialize isComplete property
  });

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      deadline: data['deadline'] != null ? (data['deadline'] as Timestamp).toDate() : DateTime.now(),
      expectedDuration:  data['duration'] ?? "0",
      isComplete: data['isComplete'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline,
      'duration': expectedDuration,
      'isComplete': isComplete,
    };
  }
}