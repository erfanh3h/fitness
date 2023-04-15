import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class WorkoutDaysController extends BaseController {
  WorkoutDaysController();

  final String userEmail = Get.find<GlobalController>().userEmail ?? '';

  //go to day workouts list
  void goToDetails(String day) {
    Get.toNamed(AppRoutes.dayDetails, arguments: day);
  }
}
