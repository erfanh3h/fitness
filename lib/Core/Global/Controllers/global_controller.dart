import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Global/Core/global_repository.dart';
import 'package:fitness/Core/Global/Models/settings.dart';
import 'package:fitness/Core/Storage/user_storage_controller.dart';

import '../Models/user_data_model.dart';
import '../Models/user_tokens_model.dart';

class GlobalController extends BaseController {
  final GlobalRepository globalRepo;

  var selectedPage = 2.obs;

  GlobalController(this.globalRepo);
  changePage(int page) {
    selectedPage.value = page;
    pgCtrl.jumpToPage(page);
  }

  PageController pgCtrl = PageController(initialPage: 2);
  final Rx<UserDataModel?> _user = Rx(null);
  UserDataModel? get user => _user.value;
  set user(UserDataModel? userData) {
    _user.value = userData;
  }

  final Rx<UserTokensModel?> _userTokens = Rx(null);
  UserTokensModel? get userTokens => _userTokens.value;
  set userTokens(UserTokensModel? userData) {
    _userTokens.value = userData;
  }

  String get token =>
      _userTokens.value != null ? (_userTokens.value!.token ?? '') : '';
  Uint8List? get image => _user.value != null ? (_user.value!.image) : null;
  String get username =>
      _user.value != null ? (_user.value!.username ?? '') : '';

  final Rx<SettingsModel?> _settings = Rx(null);
  SettingsModel? get settings => _settings.value;
  set settings(SettingsModel? settingsData) {
    _settings.value = settingsData;
  }

  Future<void> fetchUserTokens() async {
    final storageController = Get.find<UserStoreController>();
    _userTokens.value = await storageController.getUserTokens();
  }

  Future<void> saveUserData(final UserDataModel userData) async {
    final storageController = Get.find<UserStoreController>();
    await storageController.saveUserData(userData);
    _user.value = userData;
  }

  Future<void> saveUserTokens(final UserTokensModel userTokens) async {
    final storageController = Get.find<UserStoreController>();
    await storageController.saveUserTokens(userTokens);
    _userTokens.value = userTokens;
  }

  Future<void> removeUserData() async {
    final storageController = Get.find<UserStoreController>();
    storageController.removeData();
    _user.value = null;
    _userTokens.value = null;
  }

  Future updateUserData() async {
    // var result = await profileRepo.getProfile();
    // if (result.resultData != null) {
    //   saveUserData(result.resultData!);
    // } else {}
  }

  Future initData() async {
    // await fetchUserTokens();
    // if (_userTokens.value == null || _userTokens.value!.token == null) {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     Get.offNamed(AppRoutes.login);
    //   });
    // } else {
    //   if (userTokens!.isRegisterDone ?? true) {
    //     await updateUserData();
    //     Get.offNamed(AppRoutes.home);
    //   } else {
    //     Future.delayed(const Duration(seconds: 1), () {
    //       Get.offNamed(AppRoutes.editProfile, arguments: true);
    //     });
    //   }
    // }
  }

  @override
  void onReady() async {
    await initData();
    super.onReady();

    return;
  }
}
