import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/theme/app_colors.dart';
import 'package:tasker/app/theme/styles.dart';


class CustomBoxWithError extends StatelessWidget {
  const CustomBoxWithError({
    super.key,
    required this.onTap,
    this.isError = false,
    required this.text,
    this.errorMassage = Strings.empty,
  });

  final VoidCallback onTap;
  final bool isError;
  final String text;
  final String errorMassage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isError ? Colors.red : AppColors.black),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: Styles.tsPrimaryColorRegular18,
            ),
          ),
        ),
        isError
            ? Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            errorMassage,
            style: Styles.tsPrimaryColorRegular14,
          ),
        )
            : const SizedBox.shrink()
      ],
    );
  }
}