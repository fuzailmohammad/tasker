import 'package:get/get.dart';

import '../controllers/view_task_controller.dart';

class ViewTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewTaskController>(
      () => ViewTaskController(),
    );
  }
}
