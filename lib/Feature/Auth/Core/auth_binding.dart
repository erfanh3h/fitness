import 'package:fitness/Feature/Auth/Controllers/login_controller.dart';
import 'package:fitness/Feature/Auth/Controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:fitness/Feature/Auth/Core/auth_repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find<AuthRepository>()),
      fenix: true,
    );
  }
}
