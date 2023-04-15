import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_radiuses.dart';
import 'package:fitness/Core/Resources/app_spacings.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:fitness/Feature/Workout/Models/workout_details.dart';
import 'package:flutter/material.dart';

class WorkoutRowWidget extends StatelessWidget {
  const WorkoutRowWidget({
    super.key,
    required this.data,
    required this.onTap,
    required this.onDelete,
  });
  final WorkoutDetailsModel data;
  final Function onTap;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(data);
      },
      child: Container(
        padding: AppSpacings.sAll16,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: AppRadiuses.radiusAll14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${data.name} - ${data.time} min',
              style: AppTextStyles.headline3,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                onDelete(data.id);
              },
              child: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
