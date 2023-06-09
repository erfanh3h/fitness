import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Feature/Auth/Core/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  final AuthRepository _repo;
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  RxBool passObscure = true.obs;
  var formKey = GlobalKey<FormState>();

  RxBool isChecked = false.obs;

  RegisterController(this._repo);

  // register to account function
  register() async {
    if (!formKey.currentState!.validate()) return;
    isPageLoading.value = true;
    var result = await _repo.register(
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );
    if (result.resultData != null) {
      ShowMessageCompanent(message: 'You have registered successfully').show();
      Get.offAllNamed(AppRoutes.days);
    } else {
      ShowMessageCompanent(message: result.errorData!.result).show();
    }
    isPageLoading.value = false;
  }

  void changeObscure() {
    passObscure.value = !passObscure.value;
  }

  void goToLogin() {
    Get.back();
  }
}
