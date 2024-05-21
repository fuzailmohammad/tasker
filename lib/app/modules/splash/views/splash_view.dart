import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/images.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(Images.icAppLogo, height: 100, width: 100,),

      ),
    );
  }
}
