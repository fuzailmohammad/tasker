import 'package:get/get.dart';
import 'package:tasker/app/app_controller.dart';
import 'package:tasker/app/data/network/firebase_auth_service.dart';
import 'package:tasker/app/data/network/firestore_service.dart';
import 'package:tasker/app/data/network/network_requester.dart';
import 'package:tasker/app/data/repository/config_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(ConfigRepository(), permanent: true);
    Get.put(AppController(), permanent: true);
    Get.put(FirestoreService.instance, permanent: true);
    Get.put(AuthService(), permanent: true);
  }
}
