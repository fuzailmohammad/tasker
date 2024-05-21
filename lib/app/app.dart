import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/app_binding.dart';
import 'package:tasker/app/data/values/constants.dart';
import 'package:tasker/app/data/values/env.dart';
import 'package:tasker/app/routes/app_pages.dart';
import 'package:tasker/app/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.title,
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
