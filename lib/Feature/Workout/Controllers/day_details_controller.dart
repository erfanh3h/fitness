import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:get/get.dart';

class DayDetailsController extends BaseController {
  final WorkoutRepository _repo;
  DayDetailsController(this._repo);

  void goToDetails(String day) {}
  void goToAddWorkout() {
    Get.toNamed(AppRoutes.addWorkout);
  }
}
