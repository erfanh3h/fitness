import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Components/validator.dart';
import 'package:fitness/Core/Global/Widgets/global_appbar.dart';
import 'package:fitness/Core/Global/Widgets/global_input_box.dart';
import 'package:fitness/Core/Global/Widgets/global_submit_button.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Workout/Controllers/add_workout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddWorkoutPage extends BaseView<AddWorkoutController> {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context) {
    return const GlobalAppbar(
      title: 'Training Add',
    ).build(context);
  }

  @override
  Widget body(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: AppSpacings.sAll16,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.r),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add the workout of your choice.",
                  style: AppTextStyles.header2,
                ),
              ),
              SizedBox(height: 35.r),
              GlobalInputBox(
                label: 'Training Name',
                controller: controller.nameCtrl,
                validator: Validators.validateName,
              ),
              SizedBox(height: 20.r),
              GlobalInputBox(
                label: 'Training Time',
                controller: controller.timeCtrl,
                validator: Validators.validateName,
                textType: TextInputType.number,
              ),
              SizedBox(height: 20.r),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: Get.size.width / 2,
                  child: GlobalSubmitButton(
                    func: controller.create,
                    title: 'Add',
                  ),
                ),
              ),
              SizedBox(height: 25.r),
            ],
          ),
        ),
      ),
    );
  }
}
