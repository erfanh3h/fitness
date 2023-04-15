import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalLoadingWidget extends StatelessWidget {
  const GlobalLoadingWidget({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
        strokeWidth: size ?? 4.0,
      ),
    );
  }
}
