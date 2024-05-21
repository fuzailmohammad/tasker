import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/strings.dart';

class FirebaseAuthAPIException implements Exception {
  final String message;

  FirebaseAuthAPIException({required this.message});
}

class FirebaseAuthExceptionHandler {
  FirebaseAuthExceptionHandler._privateConstructor();

  static FirebaseAuthAPIException handleError(Exception error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return FirebaseAuthAPIException(message: ErrorMessages.userNotFound);
        case 'email-already-in-use':
          return FirebaseAuthAPIException(
              message: ErrorMessages.emailAlreadyUsed);
        case 'invalid-email':
          return FirebaseAuthAPIException(message: ErrorMessages.invalidEmail);
        case 'operation-not-allowed':
          return FirebaseAuthAPIException(
              message: ErrorMessages.operationNotAllowed);
        case 'weak-password':
          return FirebaseAuthAPIException(message: ErrorMessages.weekPassword);
        case 'user-disabled':
          return FirebaseAuthAPIException(message: ErrorMessages.userDisabled);
        case 'wrong-password':
          return FirebaseAuthAPIException(message: ErrorMessages.wrongPassword);
        case 'invalid-phone-number':
          return FirebaseAuthAPIException(message: ErrorMessages.invalidPhone);
        case 'quota-exceeded':
          return FirebaseAuthAPIException(message: ErrorMessages.quotaExceeded);
        case 'session-expired':
          return FirebaseAuthAPIException(
              message: ErrorMessages.sessionExpired);
        case 'invalid-verification-code':
          return FirebaseAuthAPIException(message: ErrorMessages.invalidOtp);
        case 'session-rejected':
          return FirebaseAuthAPIException(message: ErrorMessages.sessionReject);

        default:
          return FirebaseAuthAPIException(
              message: ErrorMessages.networkGeneral);
      }
    } else {
      return FirebaseAuthAPIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class FirebaseAuthHandleError {
  FirebaseAuthHandleError._privateConstructor();

  static firebaseAuthHandleError(FirebaseAuthAPIException? error) {
    Get.rawSnackbar(message: error?.message ?? ErrorMessages.networkGeneral);
  }
}