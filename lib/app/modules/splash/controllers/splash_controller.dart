import 'package:get/get.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/utils/storage/storage_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startOnboarding();
  }

  _startOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));

    if (Storage.isUserExists()) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.AUTH_SIGNUP);
    }
  }
}
