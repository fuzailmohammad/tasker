import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/models/dto/task.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/theme/app_colors.dart';
import 'package:tasker/app/theme/styles.dart';

import '../controllers/view_task_controller.dart';

class ViewTaskView extends GetView<ViewTaskController> {
  const ViewTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIEW TASK'),
        centerTitle: true,
      ),
      body: TaskDetailBox(
        task: controller.task,
      ),
    );
  }
}

class TaskDetailBox extends StatelessWidget {
  final Task task;

  const TaskDetailBox({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: Styles.tsPrimaryColorRegular18,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: Get.width,
            decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                TitleText(
                  title: '${Strings.description}: ',
                  text: task.description,
                ),
                TitleText(
                  title: '${Strings.deadline}: ',
                  text: task.deadline.toString(),
                ),
                TitleText(
                    title: '${Strings.expectedTime}: ',
                    text: task.expectedDuration.toString())
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Icon(
          task.isComplete
              ? CupertinoIcons.checkmark_rectangle_fill
              : CupertinoIcons.xmark_rectangle,
          size: 100,
          color: task.isComplete ? AppColors.green : AppColors.grey,
        )
      ],
    );
  }
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    100,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class TitleText extends StatelessWidget {
  final String title;
  final String text;

  const TitleText({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.tsPrimaryColorRegular14,
        ),
        Text(
          text,
          style: Styles.tsPrimaryColorRegular14,
        ),
      ],
    );
  }
}
