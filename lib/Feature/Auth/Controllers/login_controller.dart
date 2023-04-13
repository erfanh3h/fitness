import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Feature/Auth/Core/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//R59acd69
class LoginController extends BaseController {
  final AuthRepository _repo;
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  RxBool passObscure = true.obs;
  var formKey = GlobalKey<FormState>();

  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPass = TextEditingController();
  TextEditingController rePass = TextEditingController();
  TextEditingController inviteCode = TextEditingController();

  RxBool isChecked = false.obs;

  LoginController(this._repo);

  login() async {
    // print(emailCtrl.text);
    if (!formKey.currentState!.validate()) return;
    isPageLoading.value = true;
    var result = await _repo.login(
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );
    if (result.resultData != null) {
      var globalController = Get.find<GlobalController>();
      await globalController.saveUserTokens(result.resultData!);
      await globalController.initData();
      // if (result.resultData!.isRegisterDone ?? true) {
      //   await globalController.updateUserData();
      //   Get.offNamed(AppRoutes.home);
      // } else {
      //   Get.offAndToNamed(AppRoutes.editProfile, arguments: true);
      // }
      // this use to add view profile dependencies
      ShowMessageCompanent(message: 'You have entered successfully').show();
    }
    isPageLoading.value = false;
  }

  void gotoRegister() async {
    Get.toNamed(AppRoutes.register);
  }

  void gotoForgetPassword() async {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  void gotoRoles() async {
    Get.toNamed(AppRoutes.roles);
  }

  void checkValue({required bool value}) {
    isChecked(value);
  }

  void changeObscure() {
    passObscure.value = !passObscure.value;
  }
}
