import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/app/data/values/images.dart';
import 'package:tasker/app/data/values/strings.dart';
import 'package:tasker/app/modules/auth/login/controllers/auth_login_controller.dart';
import 'package:tasker/app/theme/app_colors.dart';
import 'package:tasker/widgets/buttons/primary_filled_button.dart';
import 'package:tasker/widgets/text_field/custom_text_field.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: Get.height-100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Images.icAppLogo, height: 100, width: 100,),
                const SizedBox(height: 10.0),
                CustomTextField(
                  wrapper: controller.emailWrapper,
                  hintText: Strings.email,
                  inputType: TextInputType.emailAddress,

                ),
                const SizedBox(height: 10.0),
                Obx(
                  () => CustomTextField(
                    wrapper: controller.passwordWrapper,
                    hintText: Strings.password,
                    suffix: InkWell(
                      child: Icon(
                        controller.isPasswordHidden.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: AppColors.primaryColor,
                        size: 22,
                      ),
                      onTap: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                    obscureText: controller.isPasswordHidden.value,
                  ),
                ),
                const SizedBox(height: 10.0),
                PrimaryFilledButton(
                  text: Strings.login,
                  onTap: controller.login,
                ),
                const SizedBox(height: 10.0),
                TextButton(onPressed: controller.goToSignup, child: const Text(Strings.createAccount))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
