import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateWorkoutController extends BaseController {
  final WorkoutRepository _repo;
  UpdateWorkoutController(this._repo);

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();
  late WorkoutDetailsModel workout;

  var formKey = GlobalKey<FormState>();

  //update workout function
  updateWorkout() async {
    if (!formKey.currentState!.validate()) return;
    isPageLoading.value = true;
    var result = await _repo.updateWorkout(
      name: nameCtrl.text,
      time: timeCtrl.text,
      id: workout.id!,
    );
    if (result.resultData != null) {
      ShowMessageCompanent(message: 'Workout updated successfully').show();
      final WorkoutDetailsModel newWorkout = WorkoutDetailsModel(
        id: workout.id,
        day: workout.day,
        userid: workout.userid,
        name: nameCtrl.text,
        time: timeCtrl.text,
        date: workout.date,
      );
      Get.back(result: newWorkout);
    } else {
      ShowMessageCompanent(message: result.errorData!.result).show();
    }
    isPageLoading.value = false;
  }

  @override
  void onInit() {
    workout = Get.arguments;
    nameCtrl.text = workout.name ?? '';
    timeCtrl.text = workout.time ?? '';
    super.onInit();
  }
}
