extension TextValidators on String {
  bool isValidEmail() => RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$")
      .hasMatch(trim());

  bool isValidPhone() =>
      trim().isNotEmpty && int.parse(trim()).toString().length == 10;

  bool isValidOTP() => trim().length == 4;

  bool isValidPassword() => trim().length >= 6;

  bool isValidName() => trim().isNotEmpty;
}
