import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:get/get.dart';

class WorkoutBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MusicDetailsController());
    Get.lazyPut<WorkoutRepository>(
      () => WorkoutRepositoryImp(),
      fenix: true,
    );
    // Get.lazyPut<LoginController>(
    //   () => LoginController(Get.find<WorkoutRepository>()),
    //   fenix: true,
    // );
    // Get.lazyPut<RegisterController>(
    //   () => RegisterController(Get.find<WorkoutRepository>()),
    //   fenix: true,
    // );
  }
}
