import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
//headers
  static final headline1 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final headline2 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static final headline3 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final headline4 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.primary,
  );

  static final header = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
  );
}
