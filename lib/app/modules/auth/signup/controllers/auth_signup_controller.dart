import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/network/firebase_auth_service.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/utils/helper/exception_handler_firebase_auth.dart';
import 'package:tasker/utils/helper/text_field_wrapper.dart';
import 'package:tasker/utils/helper/validators.dart';
import 'package:tasker/utils/loading/loading_utils.dart';

class AuthSignupController extends GetxController {
  //TODO: Implement AuthSignupController

  final TextFieldWrapper nameWrapper = TextFieldWrapper();
  final TextFieldWrapper emailWrapper = TextFieldWrapper();
  final TextFieldWrapper passwordWrapper = TextFieldWrapper();

  final authService = Get.find<AuthService>();

  var isPasswordHidden = true.obs;

  final mobileWrapper = TextFieldWrapper();

  goToLogin() {
    Get.offAllNamed(Routes.AUTH_LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String username = nameWrapper.controller.text.trim();
    String email = emailWrapper.controller.text.trim();
    String password = passwordWrapper.controller.text.trim();


    if (username.isNotEmpty) {
      nameWrapper.errorText = Strings.empty;
    } else {
      nameWrapper.errorText = ErrorMessages.invalidName;
      return;
    }
    if (email.isValidEmail()) {
      emailWrapper.errorText = Strings.empty;
    } else {
      emailWrapper.errorText = ErrorMessages.invalidEmail;
      return;
    }
    if (password.isValidPassword()) {
      passwordWrapper.errorText = Strings.empty;
    } else {
      passwordWrapper.errorText = ErrorMessages.invalidPassword;
      return;
    }


    try {
      LoadingUtils.showLoader();
      await AuthService().registerWithEmailPassword(
       username,
        email,
        password
      );
      LoadingUtils.hideLoader();
      Get.rawSnackbar(message: "You are successfully logged in");
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      LoadingUtils.hideLoader();
      if (e is FirebaseAuthAPIException) {
        FirebaseAuthHandleError.firebaseAuthHandleError(e);
      } else {
        Get.rawSnackbar(message: ErrorMessages.networkGeneral);
      }
    }
  }
}
