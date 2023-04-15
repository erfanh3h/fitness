import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';
import 'package:get/get.dart';

class DayDetailsController extends BaseController {
  final WorkoutRepository _repo;
  DayDetailsController(this._repo);

  late String day;
  RxList<WorkoutDetailsModel> data = RxList([]);

  getData() async {
    isPageLoading.value = true;
    var result = await _repo.readWorkouts(day: day);
    if (result.resultData != null) {
      data.value = result.resultData!;
      isPageLoading.value = false;
    } else {
      ShowMessageCompanent(message: result.errorData!.result).show();
      Get.back();
    }
  }

  void goToUpdate(WorkoutDetailsModel workout) {
    Get.toNamed(AppRoutes.updateWorkout, arguments: workout);
  }

  void deleteWorkout(String id) {
    print(id);
  }

  void goToAddWorkout() {
    Get.toNamed(AppRoutes.addWorkout);
  }

  @override
  void onInit() {
    day = Get.arguments;
    getData();
    super.onInit();
  }
}
