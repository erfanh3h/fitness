import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_radiuses.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';

class SelectDayWidget extends StatelessWidget {
  const SelectDayWidget({super.key, required this.name, required this.onTap});
  final String name;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(name);
      },
      child: Container(
        padding: AppSpacings.sAll16,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: AppRadiuses.radiusAll14,
        ),
        child: Text(
          name,
          style: AppTextStyles.headline3,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
