import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimePicker {
  static Future<DateTime?> pickDate(
      {required DateTime date, DateTime? firstDate}) async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: date,
      firstDate: firstDate ?? DateTime(1990),
      lastDate: DateTime(2050),
    );
    return pickedDate;
  }

  static Future<TimeOfDay?> pickTime({required TimeOfDay time}) async {
    final pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: time,
    );

    return pickedTime;
  }



  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}