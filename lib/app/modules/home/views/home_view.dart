import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/app/theme/styles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: controller.logout, icon: Icon(CupertinoIcons.power))
        ],
      ),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return Center(child: Text(controller.centerText.value, style: Styles.tsPrimaryColorRegular18,));
        } else {
          return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final task = controller.tasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 5,
                  title: Text(task.title ?? ''),
                  subtitle: Text(task.description ?? ''),
                  onTap: () {
                   controller.goToViewTask(index);
                  },
                  trailing: Obx(()=>Checkbox(
                    value: controller.tasks[index].isComplete,
                    onChanged: (value) {
                      controller.updateTaskCompletion(task, value ?? false);
                    },
                  ),),
                  tileColor: getRandomColor(),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_TASK);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
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
