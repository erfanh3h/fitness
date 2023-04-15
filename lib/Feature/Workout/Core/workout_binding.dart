import 'package:fitness/Feature/Workout/Controllers/add_workout_controller.dart';
import 'package:fitness/Feature/Workout/Controllers/day_details_controller.dart';
import 'package:fitness/Feature/Workout/Controllers/update_workout_controller.dart';
import 'package:fitness/Feature/Workout/Controllers/workout_days_controller.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:get/get.dart';

class WorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutRepository>(
      () => WorkoutRepositoryImp(),
      fenix: true,
    );
    Get.lazyPut<WorkoutDaysController>(
      () => WorkoutDaysController(),
      fenix: true,
    );
    Get.lazyPut<DayDetailsController>(
      () => DayDetailsController(Get.find<WorkoutRepository>()),
      fenix: true,
    );
    Get.lazyPut<AddWorkoutController>(
      () => AddWorkoutController(Get.find<WorkoutRepository>()),
      fenix: true,
    );
    Get.lazyPut<UpdateWorkoutController>(
      () => UpdateWorkoutController(Get.find<WorkoutRepository>()),
      fenix: true,
    );
  }
}
