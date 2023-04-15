import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Widgets/global_loading.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends BaseView<GlobalController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'FitTrack',
          style: AppTextStyles.headline1.copyWith(fontSize: 64.sp),
        ),
        SizedBox(height: 15.r),
        const Center(child: GlobalLoadingWidget()),
      ],
    );
  }
}
