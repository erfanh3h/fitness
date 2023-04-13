import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () => const SplashScreen(),
    //   transition: Transition.fadeIn,
    // ),
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
