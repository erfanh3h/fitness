import 'package:fitness/Core/Base/base_controller.dart';
import 'package:fitness/Core/Components/show_message.dart';
import 'package:fitness/Feature/Workout/Core/workout_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkoutController extends BaseController {
  final WorkoutRepository _repo;
  AddWorkoutController(this._repo);

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();
  late String day;

  var formKey = GlobalKey<FormState>();

  create() async {
    if (!formKey.currentState!.validate()) return;
    isPageLoading.value = true;
    var result = await _repo.createWorkout(
      name: nameCtrl.text,
      time: timeCtrl.text,
      day: day,
    );
    if (result.resultData != null) {
      final data = result.resultData!;
      ShowMessageCompanent(message: 'Workout added successfully').show();
      Get.back(result: data);
    } else {
      ShowMessageCompanent(message: result.errorData!.result).show();
    }
    isPageLoading.value = false;
  }

  @override
  void onInit() {
    day = Get.arguments;
    super.onInit();
  }
}
