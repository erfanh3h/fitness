import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Widgets/global_appbar.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Workout/Controllers/add_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: AppSpacings.sAll16,
      child: ListView(
        children: [
          SizedBox(height: 20.r),
          Text(
            'Hello,irem',
            style: AppTextStyles.headline1.copyWith(fontSize: 19.r),
          ),
          SizedBox(height: 25.r),
        ],
      ),
    );
  }
}
