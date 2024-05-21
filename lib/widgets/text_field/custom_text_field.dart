import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/theme/app_colors.dart';
import 'package:tasker/app/theme/styles.dart';
import 'package:tasker/utils/helper/text_field_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final bool obscureText;
  final Widget? suffix;

  const CustomTextField({super.key,
    required this.wrapper,
    required this.hintText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.obscureText = false,
    this.suffix, this.inputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: wrapper.controller,
        style: Styles.tsPrimaryColorRegular18,
        maxLength: maxLength,
        keyboardType: inputType,
        enabled: isEnabled,
        obscureText: obscureText,
        textInputAction: inputAction,
        decoration: InputDecoration(
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle: Styles.tsPrimaryColorRegular18,
          counterText: '',
          fillColor: AppColors.white,
          filled: true,
          suffix: suffix,
          hintText: hintText,
          enabled: isEnabled,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
