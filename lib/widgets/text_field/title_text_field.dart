import 'package:flutter/material.dart';
import 'package:tasker/app/theme/styles.dart';


class TitleTextField extends StatelessWidget {
  final String title;
  final Widget textField;

  const TitleTextField({
    super.key,
    required this.title,
    required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: Styles.tsPrimaryColorRegular18,
          ),
          const SizedBox(
            height: 2,
          ),
          Center(child: textField)
        ],
      ),
    );
  }
}