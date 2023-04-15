import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Widgets/global_appbar.dart';
import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Workout/Controllers/day_details_controller.dart';
import 'package:fitness/Feature/Workout/Widgets/workout_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayDetailsPage extends BaseView<DayDetailsController> {
  const DayDetailsPage({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context) {
    return const GlobalAppbar(
      title: 'Workouts',
    ).build(context);
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      onPressed: controller.goToAddWorkout,
      backgroundColor: AppColors.primary,
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
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
            style: AppTextStyles.header2,
          ),
          const SizedBox(height: 10),
          Text(
            'Choose the day you want to make reservations',
            style: AppTextStyles.headline2.copyWith(fontSize: 12.r),
          ),
          SizedBox(height: 30.r),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return WorkoutRowWidget(
                data: controller.data[index],
                onTap: controller.goToUpdate,
                onDelete: controller.deleteWorkout,
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 15.r,
              );
            },
            itemCount: controller.data.length,
          ),
          SizedBox(height: 25.r),
        ],
      ),
    );
  }
}
