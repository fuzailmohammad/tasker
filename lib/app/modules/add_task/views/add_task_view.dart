import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/widgets/box/custom_box_with_error.dart';
import 'package:tasker/widgets/buttons/primary_filled_button.dart';
import 'package:tasker/widgets/text_field/custom_text_field.dart';
import 'package:tasker/widgets/text_field/title_text_field.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD TASK'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
                wrapper: controller.titleController,
                hintText: Strings.title,
              ),

            const SizedBox(height: 10),
             CustomTextField(
                wrapper: controller.descriptionController,
                hintText: Strings.description,
              ),

            const SizedBox(height: 10),
            TitleTextField(
              title: Strings.dateAndTime,
              textField: Obx(
                () => CustomBoxWithError(
                  onTap: controller.chooseDateAndTimeOfAccident,
                  text: controller.showDateAndTimeOfDeadline.value,
                  isError: controller.isDateTimeError.value,
                  errorMassage: ErrorMessages.invalidSelectionDate,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => TitleTextField(
                title: Strings.expectedTime,
                textField: DurationPicker(
                  duration: controller.expectedDuration.value,
                  baseUnit: BaseUnit.minute,
                  onChange: (value) {
                    controller.changeDuration(value);
                  },
                  snapToMins: 5.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => CheckboxListTile(
                  title: const Text('Complete'),
                  value: controller.isComplete.value,
                  onChanged: (newValue) {
                    controller.isComplete.value = newValue ?? false;
                  },
                )),
            const SizedBox(height: 10),
            PrimaryFilledButton(text: 'Add Task', onTap: controller.addTask)
          ],
        ),
      ),
    );
  }
}
