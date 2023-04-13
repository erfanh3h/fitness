import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Components/validator.dart';
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
            GlobalInputBox(
              label: 'Email',
              controller: controller.emailCtrl,
              validator: Validators.validateEmail,
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
                validator: Validators.validatePassword,
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
            SizedBox(height: 25.r),
          ],
        ),
      ),
    );
  }
}
