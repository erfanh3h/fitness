import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Core/Global/Core/global_binding.dart';
import 'Core/Global/Page/splash_screen.dart';
import 'Core/Routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(UserDataModelAdapter());
  runApp(
    ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          home: const SplashScreen(),
          initialBinding: GlobalBinding(),
        );
      },
    ),
  );
}
