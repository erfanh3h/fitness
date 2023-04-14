import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Components/validator.dart';
import 'package:fitness/Core/Global/Widgets/global_input_box.dart';
import 'package:fitness/Core/Global/Widgets/global_submit_button.dart';
import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SizedBox(
      height: Get.height,
      width: Get.height,
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: AppSpacings.sAll16,
          child: ListView(
            children: [
              SizedBox(height: 75.r),
              Text(
                'Hi,Welcome Back',
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 10),
              Text(
                'Login to your account',
                style: AppTextStyles.headline2,
              ),
              SizedBox(height: 40.r),
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
              SizedBox(height: 25.r),
              Row(
                children: [
                  InkWell(
                    onTap: controller.goToRegister,
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.headline3,
                    ),
                  ),
                  Text(
                    '  Or',
                    style: AppTextStyles.headline3,
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColors().grey10,
                    foregroundColor: AppColors.primary,
                    child: Icon(
                      Icons.facebook,
                      size: 30.r,
                    ),
                  ),
                  SizedBox(width: 10.r),
                  CircleAvatar(
                    backgroundColor: AppColors().grey10,
                    foregroundColor: AppColors.primary,
                    child: Icon(
                      Icons.g_mobiledata,
                      size: 30.r,
                    ),
                  ),
                  SizedBox(width: 10.r),
                  CircleAvatar(
                    backgroundColor: AppColors().grey10,
                    foregroundColor: AppColors.primary,
                    child: Icon(
                      Icons.apple,
                      size: 30.r,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 265.r),
              GlobalSubmitButton(
                func: controller.login,
                title: 'login',
              ),
              SizedBox(height: 25.r),
            ],
          ),
        ),
      ),
    );
  }
}
