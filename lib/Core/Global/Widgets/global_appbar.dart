import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GlobalAppbar extends StatelessWidget {
  final String title;
  final IconData? backIcon;
  final bool haveLogoutButton;
  final bool haveBackButton;
  const GlobalAppbar({
    Key? key,
    required this.title,
    this.backIcon,
    this.haveBackButton = true,
    this.haveLogoutButton = true,
  }) : super(key: key);

  logoutAction() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure for logout?',
      actions: [
        TextButton(
          onPressed: Get.find<GlobalController>().logout,
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: Get.back,
          child: const Text('No'),
        ),
      ],
    );
  }

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Visibility(
            visible: haveBackButton,
            child: InkWell(
              onTap: Get.back,
              child: Icon(
                backIcon ?? Icons.chevron_left,
                size: 25.r,
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyles.header,
          ),
          const Spacer(),
          Visibility(
            visible: haveLogoutButton,
            child: InkWell(
              onTap: logoutAction,
              child: Icon(
                Icons.logout,
                size: 25.r,
                color: AppColors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
