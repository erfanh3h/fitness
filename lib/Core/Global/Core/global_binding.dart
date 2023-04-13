import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Controllers/main_controller.dart';
import 'package:fitness/Feature/Auth/Core/auth_binding.dart';
import 'package:get/get.dart';

import 'global_repository.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.lazyPut<GlobalRepository>(
      () => GlobalRepositoryImp(),
      fenix: true,
    );
    Get.put(
      GlobalController(Get.find<GlobalRepository>()),
    );
    AuthBinding().dependencies();
  }
}
