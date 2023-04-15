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

  String? userEmail;

  loginToPrevious() async {
    await Future.delayed(const Duration(seconds: 4));
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      userEmail = auth.currentUser!.email!;
      Get.offNamed(AppRoutes.days);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }

  logout() async {
    var result = await authRepository.logout();
    if (result) {
      ShowMessageCompanent(message: 'You have signed out successfully').show();
      Get.offAllNamed(AppRoutes.login);
    } else {
      ShowMessageCompanent(message: 'Error to sign out').show();
    }
  }

  @override
  void onReady() async {
    loginToPrevious();
    super.onReady();
    return;
  }
}
