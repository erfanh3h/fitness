import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GlobalAppbar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextTheme? textTheme;
  final IconData? backIcon;
  const GlobalAppbar({
    Key? key,
    required this.title,
    this.subtitle,
    this.textTheme,
    this.backIcon,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: Get.back,
            child: Icon(
              backIcon ?? Icons.chevron_left,
              size: 25.r,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.header,
          ),
        ],
      ),
    );
  }
}
