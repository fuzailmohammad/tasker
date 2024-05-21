import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/network/firebase_auth_service.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/utils/helper/date_time_picker.dart';
import 'package:tasker/utils/helper/exception_handler.dart';
import 'package:tasker/utils/helper/exception_handler_cloud_firestore.dart';
import 'package:tasker/utils/helper/text_field_wrapper.dart';
import 'package:tasker/utils/loading/loading_utils.dart';
import 'package:tasker/utils/storage/storage_utils.dart';

class AddTaskController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextFieldWrapper titleController = TextFieldWrapper();
  final TextFieldWrapper descriptionController = TextFieldWrapper();

  final isComplete = false.obs;

  final isDateTimeChange = false.obs;
  final isDateTimeError = false.obs;
  var showDateAndTimeOfDeadline = "DD/MM/YYYY H:MM a".obs;
  var selectedDateOfDeadline = DateTime.now().obs;
  var selectedTimeOfDeadline = TimeOfDay.now().obs;
  var expectedDuration = Duration.zero.obs;


  Future<void> chooseDateAndTimeOfAccident() async {
    await pickDate();
    await pickTime();
  }

  void changeDuration(Duration value){
    expectedDuration.value = value;
  }

  Future<void> pickDate() async {
    final pickedDate =
    await DateTimePicker.pickDate(date: selectedDateOfDeadline.value);

    if (pickedDate != null) {
      selectedDateOfDeadline.value = pickedDate;
      showDateAndTimeOfDeadline.value = DateTimePicker.formatDate(pickedDate);
    } else {
      HandleError.showError(ErrorMessages.invalidSelectionDate);
    }
  }



  Future<void> pickTime() async {
    final pickedTime =
    await DateTimePicker.pickTime(time: selectedTimeOfDeadline.value);

    if (pickedTime != null) {
      selectedTimeOfDeadline.value = pickedTime;
      isDateTimeChange.value = true;
      isDateTimeError.value = false;
      showDateAndTimeOfDeadline.value += ', ${pickedTime.format(Get.context!)}';
    } else {
      HandleError.showError(ErrorMessages.invalidSelectionTime);
    }
  }

  Future<void> addTask() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final title = titleController.controller.text.trim();
    final description = descriptionController.controller.text.trim();
    final deadlineTime = selectDeadline(selectedDateOfDeadline.value, selectedTimeOfDeadline.value);
    final expectedDurationS = expectedDuration.value;
    final userId = Get.find<AuthService>().currentUser?.uid;

    if (title.isNotEmpty) {
      titleController.errorText = Strings.empty;
    } else {
      titleController.errorText = ErrorMessages.invalidTitle;
      return;
    }

    if (description.isNotEmpty) {
      descriptionController.errorText = Strings.empty;
    } else {
      descriptionController.errorText = ErrorMessages.invalidDescription;
      return;
    }

    if (!isDateTimeChange.value){
      isDateTimeError.value = true;
      HandleError.showError(ErrorMessages.invalidDateTime);
      return;
    }

    if(expectedDurationS == Duration.zero){
      HandleError.showError(ErrorMessages.invalidEstimatedDuration);
      return;
    }



    try {
      LoadingUtils.showLoader();
      await _firestore.collection('users').doc(userId).collection('tasks').add({
        'title': title,
        'description': description,
        'deadline': deadlineTime,
        'duration': expectedDurationS.toString(),
        'isComplete': isComplete.value,
      });
      LoadingUtils.hideLoader();
      Get.rawSnackbar(message: 'Task added successfully!');
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      LoadingUtils.hideLoader();
      if (e is FirestoreAPIException) {
        FirestoreHandleError.firestoreHandleError(e);
      } else {
        Get.rawSnackbar(message:  'Failed to add task: $e');
      }

    }
  }

  DateTime selectDeadline(DateTime date, TimeOfDay time) {
    final dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return dateTime;
  }
  @override
  void onClose() {
    super.onClose();
  }
}
