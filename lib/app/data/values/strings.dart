class Strings {
  Strings._privateConstructor();

  static const appName = 'Tasker';
  static const name = 'Name';
  static const empty = '';
  static const mobileNumber = 'Mobile Number';
  static const getOTP = 'Get OTP';
  static const login = 'Login';
  static const signUp = 'Sign Up';
  static const retry = 'Retry';

  static const email = 'Email';
  static const password = 'Password';

  static const createAccount = 'Create Account';
  static const goToLogin = 'Go To Login';

  static const dateAndTime = 'Date and Time of Deadline';

  static const title = 'Title';
  static const description = 'Description';
  static const deadline = 'Deadline';
  static const deadlineDate = 'Deadline (YYYY-MM-DD)';
  static const expectedTime = 'Expected Time';
  static const status = 'Status';

}

class ErrorMessages {
  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const invalidPhone = 'Invalid Mobile number';
  static const invalidOTP = 'Invalid OTP';
  static const invalidName = 'Invalid Name';
  static const invalidEmail = 'Invalid Email';
  static const invalidTitle = 'Invalid Title';
  static const invalidDescription = 'Invalid Description';
  static const invalidEstimatedDuration  = 'Invalid Estimated Duration';
  static const invalidDateTime  = 'Invalid Date Time';

  static const invalidPassword = 'Password cannot be empty\nand must be 6 character';
  static const invalidNewPassword =
      'Password must contain eight characters, at least one uppercase letter, one number and one special character';
  static const invalidOldPassword = 'Please enter old Password';
  static const invalidNewPasswordWD = 'Invalid New Password';
  static const emailAlreadyUsed =
      "The email address provided is already associated with an existing user account.";
  static const operationNotAllowed = 'The operation requested is not allowed.';
  static const weekPassword = 'The password provided is too weak.';
  static const userDisabled =
      'Indicates that the user account has been disabled.';
  static const userNotFound = 'No user exists for the email address provided.';
  static const wrongPassword = 'The password provided is incorrect.';
  static const quotaExceeded =
      'The SMS quota for the app has been exceeded. Please contact admin';
  static const sessionExpired =
      'The SMS code has expired. Try getting a new code';
  static const invalidOtp = 'The verification code entered is not valid.';
  static const sessionReject = 'The verification request was rejected.';

  static const cancelled =
      'The operation was cancelled by the caller. Refresh the page or try again later';
  static const unknownError =
      'An unknown error occurred. please refresh the page';
  static const invalidArgument =
      'Invalid argument was provided to a Firestore method.';
  static const deadlineExceeded = 'Operation timed out.';
  static const notFound = 'The requested document or collection was not found.';
  static const alreadyExists =
      'A document with the same ID already exists in the collection.';
  static const permissionDenied =
      'You do not have permission to perform this specified operation.';
  static const resourceExhausted =
      'The resource has been exhausted. contact Admin';
  static const failedPrecondition =
      'Condition specified in this request was not met.';
  static const aborted = 'Operation is aborted.';
  static const outOfRange = 'Out of range.';
  static const unImplemented =
      'The requested operation is not implemented or supported by App. Contact Admin';
  static const internalError = 'Internal error occurred.';
  static const unavailable = 'Service is currently unavailable.';
  static const dataLoss = 'Unrecoverable data loss or corruption occurred.';
  static const invalidImage = 'Please Capture Image';
  static const invalidSelectionDate = 'Invalid Select Date';
  static const invalidSelectionTime = 'Invalid Select Time';

  static const String documentNotFound = "Document not found.";
  static const String documentExists = "Document already exists.";
  static const String operationCancelled = "Operation cancelled.";
  static const String serviceUnavailable = "Service unavailable.";
  static const String unauthenticated = "Unauthenticated.";
  static const String unimplemented = "Unimplemented.";
}
