import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/models/dto/response.dart';
import 'package:tasker/app/data/models/request/auth_request.dart';
import 'package:tasker/app/data/network/firebase_auth_service.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/base/base_controller.dart';
import 'package:tasker/utils/helper/exception_handler_firebase_auth.dart';
import 'package:tasker/utils/helper/text_field_wrapper.dart';
import 'package:tasker/utils/helper/validators.dart';
import 'package:tasker/utils/loading/loading_utils.dart';

class AuthLoginController extends GetxController {
  final TextFieldWrapper emailWrapper = TextFieldWrapper();
  final TextFieldWrapper passwordWrapper = TextFieldWrapper();

  var isPasswordHidden = true.obs;

  final authService = Get.find<AuthService>();

  final mobileWrapper = TextFieldWrapper();

  goToSignup() {
    Get.toNamed(Routes.AUTH_SIGNUP);
  }

  login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String email = emailWrapper.controller.text.trim();
    String password = passwordWrapper.controller.text.trim();


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
      await AuthService().signInWithEmailPassword(
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
