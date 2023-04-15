import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Core/Global/Core/global_repository.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../Feature/Auth/Core/auth_repository.dart';

class GlobalController extends BaseController {
  final GlobalRepository globalRepo;
  final AuthRepository authRepository;

  GlobalController(this.globalRepo, this.authRepository);

  Future<void> fetchUserTokens() async {
    // final storageController = Get.find<UserStoreController>();
    // _userTokens.value = await storageController.getUserTokens();
  }

  // Future<void> saveUserData(final UserDataModel userData) async {
  // final storageController = Get.find<UserStoreController>();
  // await storageController.saveUserData(userData);
  // _user.value = userData;
  // }

  // Future<void> saveUserTokens(final UserTokensModel userTokens) async {
  // final storageController = Get.find<UserStoreController>();
  // await storageController.saveUserTokens(userTokens);
  // _userTokens.value = userTokens;
  // }

  Future<void> removeUserData() async {
    // final storageController = Get.find<UserStoreController>();
    // storageController.removeData();
    // _user.value = null;
    // _userTokens.value = null;
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
  loginToPrevius() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Get.offNamed(AppRoutes.days);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }

  logout() async {
    var result = await authRepository.logout();
    if (result) {
      removeUserData();
      ShowMessageCompanent(message: 'You have signed out successfully').show();
      Get.offAllNamed(AppRoutes.login);
    } else {
      ShowMessageCompanent(message: 'Error to sign out').show();
    }
  }

  @override
  void onReady() async {
    loginToPrevius();
    super.onReady();
    return;
  }
}
