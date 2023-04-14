import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Widgets/global_appbar.dart';
import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_consts.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Workout/Controllers/day_details_controller.dart';
import 'package:fitness/Feature/Workout/Widgets/select_day.dart';
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
            style: AppTextStyles.headline1.copyWith(fontSize: 19.r),
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
              return SelectDayWidget(
                name: AppConsts.days[index],
                onTap: controller.goToDetails,
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 15.r,
              );
            },
            itemCount: AppConsts.days.length,
          ),
          SizedBox(height: 25.r),
        ],
      ),
    );
  }
}