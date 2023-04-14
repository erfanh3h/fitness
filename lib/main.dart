import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Feature/Auth/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Core/Global/Core/global_binding.dart';
import 'Core/Routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.registerAdapter(UserDataModelAdapter());
  runApp(
    ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          home: const LoginPage(),
          initialBinding: GlobalBinding(),
          theme: ThemeData(
            primaryColor: AppColors.primary,
          ),
        );
      },
    ),
  );
}
