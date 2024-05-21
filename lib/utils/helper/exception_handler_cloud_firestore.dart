import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/strings.dart';

class FirestoreAPIException implements Exception {
  final String message;

  FirestoreAPIException({required this.message});
}

class FirestoreExceptionHandler {
  FirestoreExceptionHandler._privateConstructor();

  static FirestoreAPIException handleError(Exception error) {
    if (error is FirebaseException && error.plugin == 'cloud_firestore') {
      switch (error.code) {
        case 'not-found':
          return FirestoreAPIException(message: ErrorMessages.documentNotFound);
        case 'already-exists':
          return FirestoreAPIException(message: ErrorMessages.documentExists);
        case 'permission-denied':
          return FirestoreAPIException(message: ErrorMessages.permissionDenied);
        case 'resource-exhausted':
          return FirestoreAPIException(message: ErrorMessages.resourceExhausted);
        case 'cancelled':
          return FirestoreAPIException(message: ErrorMessages.operationCancelled);
        case 'data-loss':
          return FirestoreAPIException(message: ErrorMessages.dataLoss);
        case 'deadline-exceeded':
          return FirestoreAPIException(message: ErrorMessages.deadlineExceeded);
        case 'failed-precondition':
          return FirestoreAPIException(message: ErrorMessages.failedPrecondition);
        case 'internal':
          return FirestoreAPIException(message: ErrorMessages.internalError);
        case 'invalid-argument':
          return FirestoreAPIException(message: ErrorMessages.invalidArgument);
        case 'unavailable':
          return FirestoreAPIException(message: ErrorMessages.serviceUnavailable);
        case 'unauthenticated':
          return FirestoreAPIException(message: ErrorMessages.unauthenticated);
        case 'aborted':
          return FirestoreAPIException(message: ErrorMessages.aborted);
        case 'out-of-range':
          return FirestoreAPIException(message: ErrorMessages.outOfRange);
        case 'unimplemented':
          return FirestoreAPIException(message: ErrorMessages.unimplemented);
        default:
          return FirestoreAPIException(message: ErrorMessages.unknownError);
      }
    } else {
      return FirestoreAPIException(message: ErrorMessages.unknownError);
    }
  }
}

class FirestoreHandleError {
  FirestoreHandleError._privateConstructor();

  static firestoreHandleError(FirestoreAPIException? error) {
    Get.rawSnackbar(message: error?.message ?? ErrorMessages.unknownError);
  }
}
