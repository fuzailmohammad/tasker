import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasker/app/data/models/dto/task.dart';
import 'package:tasker/app/data/network/firebase_auth_service.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/utils/helper/exception_handler_cloud_firestore.dart';
import 'package:tasker/utils/loading/loading_utils.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final centerText = 'No Task Found'.obs;

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }

  void logout() {
    AuthService().signOut();
    Get.offAllNamed(Routes.AUTH_LOGIN);
  }

  void fetchTasks() async {
    final userId = Get.find<AuthService>().currentUser?.uid;
    try {
      final querySnapshot = await _firestore.collection('users').doc(userId).collection('tasks').get();
      final List<Task> fetchedTasks = querySnapshot.docs
          .map((doc) => Task.fromFirestore(doc))
          .toList();
      tasks.assignAll(fetchedTasks);
    }catch (e) {
      LoadingUtils.hideLoader();
      if (e is FirestoreAPIException) {
        centerText.value = e.message;
        FirestoreHandleError.firestoreHandleError(e);
      } else {
        centerText.value = e.toString();
        Get.rawSnackbar(message:  'Error fetching task: $e');
      }

    }
  }

  void updateTaskCompletion(Task task, bool newValue) async {
    final userId = Get.find<AuthService>().currentUser?.uid;
    try {
      LoadingUtils.showLoader();
      final taskRef = _firestore.collection('users').doc(userId).collection('tasks').doc(task.id);
      await taskRef.update({'isComplete': newValue});
      task.isComplete = newValue;
      LoadingUtils.hideLoader();// Update locally
    } catch (e) {
      LoadingUtils.hideLoader();
      if (e is FirestoreAPIException) {
        centerText.value = e.message;
        FirestoreHandleError.firestoreHandleError(e);
      } else {
        centerText.value = e.toString();
        Get.rawSnackbar(message:  'Error updating task completion: $e');
      }
      LoadingUtils.hideLoader();
    }
    fetchTasks();
  }

  goToViewTask(int index){
    Get.toNamed(Routes.VIEW_TASK, arguments: tasks[index]);
  }

  @override
  void onClose() {
    // Cleanup
    super.onClose();
  }
}


