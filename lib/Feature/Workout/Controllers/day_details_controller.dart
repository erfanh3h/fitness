import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Routes/app_routes.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';
import 'package:get/get.dart';

class DayDetailsController extends BaseController {
  final WorkoutRepository _repo;
  DayDetailsController(this._repo);

  late String day;
  RxList<WorkoutDetailsModel> data = RxList([]);

  final String userEmail = Get.find<GlobalController>().userEmail ?? '';

  getData({bool isRefresh = false}) async {
    if (isRefresh) {
      data.clear();
    }
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
    Get.toNamed(AppRoutes.updateWorkout, arguments: workout)!.then((result) {
      if (result != null) {
        final index = data.indexWhere((element) => element.id == workout.id);
        data.removeAt(index);
        data.insert(index, result);
      }
    });
  }

  void deleteWorkout(String id) async {
    data.removeWhere((element) => element.id == id);
    var result = await _repo.deleteWorkout(id: id);
    if (result.resultData != null) {
    } else {}
  }

  void goToAddWorkout() {
    Get.toNamed(AppRoutes.addWorkout, arguments: day)!.then((result) {
      if (result != null) {
        data.add(result);
      }
    });
  }

  @override
  void onInit() {
    day = Get.arguments;
    getData();
    super.onInit();
  }
}
