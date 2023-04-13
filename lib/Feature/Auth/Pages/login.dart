import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Widgets/global_input_box.dart';
import 'package:fitness/Core/Global/Widgets/global_submit_button.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controllers/login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  bool resizeToAvoidBottomInset() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        padding: AppSpacings.sAll16,
        height: Get.height,
        width: Get.height,
        child: ListView(
          children: [
            Image.asset(
              "assets/images/logo file4-ai.png",
              width: 200.r,
              height: 200.r,
            ),
            GlobalInputBox(
              label: 'Email',
              controller: controller.emailCtrl,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Your Email";
                }
                if (!GetUtils.isEmail(value)) {
                  return 'Invalid email';
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => GlobalInputBox(
                label: 'Password',
                controller: controller.passwordCtrl,
                isPassword: true,
                changeObscure: controller.changeObscure,
                hideContent: controller.passObscure.value,
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your Password";
                  } else if (value.length < 6) {
                    return "The password must be more than 6 digits";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GlobalSubmitButton(
              func: controller.login,
              title: 'login',
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: controller.gotoForgetPassword,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.5,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text("or"),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            GlobalSubmitButton(
              func: controller.gotoRegister,
              title: 'Register',
              color: Colors.black,
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            const Text(
              "Registration on fitnessverse require \ninvite code from one of your friend",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            TextButton(
              onPressed: controller.gotoRoles,
              child: const Text(
                "Terms and Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 25.r),
          ],
        ),
      ),
    );
  }
}
