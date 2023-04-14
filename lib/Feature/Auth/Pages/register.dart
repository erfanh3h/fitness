import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Components/validator.dart';
import 'package:fitness/Core/Global/Widgets/global_appbar.dart';
import 'package:fitness/Core/Global/Widgets/global_input_box.dart';
import 'package:fitness/Core/Global/Widgets/global_submit_button.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Auth/Controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends BaseView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  bool resizeToAvoidBottomInset() {
    return true;
  }

  @override
  AppBar? appBar(BuildContext context) {
    return const GlobalAppbar(title: 'Create an Account').build(context);
  }

  @override
  Widget body(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: AppSpacings.sAll16,
        child: ListView(
          children: [
            SizedBox(height: 56.r),
            GlobalInputBox(
              label: 'Your Name',
              controller: controller.emailCtrl,
              validator: Validators.validateEmail,
            ),
            SizedBox(height: 15.r),
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
            SizedBox(height: 265.r),
            GlobalSubmitButton(
              func: controller.register,
              title: 'Create Account',
            ),
            SizedBox(height: 25.r),
            Text(
              'Already have an account?',
              textAlign: TextAlign.center,
              style: AppTextStyles.headline4,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: controller.goToLogin,
              child: Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: AppTextStyles.headline3,
              ),
            ),
            SizedBox(height: 25.r),
          ],
        ),
      ),
    );
  }
}
