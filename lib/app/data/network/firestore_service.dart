import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirestoreService._privateConstructor();

  static final FirestoreService instance = FirestoreService._privateConstructor();

  Future<void> addTask(Map<String, dynamic> taskData) async {
    await _firestore.collection('tasks').add(taskData);
  }

  Stream<QuerySnapshot> getTasks() {
    return _firestore.collection('tasks').snapshots();
  }

  Future<void> updateTask(String taskId, Map<String, dynamic> taskData) async {
    await _firestore.collection('tasks').doc(taskId).update(taskData);
  }

  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }
}
