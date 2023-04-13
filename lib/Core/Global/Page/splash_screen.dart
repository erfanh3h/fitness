import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Widgets/global_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends BaseView<GlobalController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/logo file4-ai.png',
            ),
          ),
          SizedBox(height: 15.r),
          const GlobalLoadingWidget(size: 75),
        ],
      ),
    );
  }
}
