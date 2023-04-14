import 'package:fitness/Core/Global/Page/splash.dart';
import 'package:fitness/Feature/Auth/Pages/login.dart';
import 'package:fitness/Feature/Auth/Pages/register.dart';
import 'package:fitness/Feature/Workout/Pages/workout_days.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.days,
      page: () => const WorkoutDaysPage(),
      transition: Transition.fadeIn,
    ),

    //   GetPage(
    //     name: AppRoutes.login,
    //     page: () => LoginPage(),
    //   ),
    //   GetPage(
    //     name: AppRoutes.messageDetails,
    //     page: () => MessageDetailsPage(),
    //     binding: BindingsBuilder(
    //       () {
    //         Get.put<MessageDetailsController>(
    //           MessageDetailsController(
    //             Get.find<MessageRepository>(),
    //             Get.find<GlobalRepository>(),
    //             Get.find<CountdownTimerComponent>(),
    //           ),
    //           tag: Get.arguments[0].toString(),
    //         );
    //       },
    //     ),
    //   ),
  ];
}
