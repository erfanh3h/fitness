import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class WorkoutDaysController extends BaseController {
  WorkoutDaysController();

  void goToDetails(String day) {
    print('object');
    Get.toNamed(AppRoutes.dayDetails, arguments: day);
  }
}
