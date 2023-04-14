import 'package:fitness/Core/Base/base_view.dart';
import 'package:fitness/Core/Global/Controllers/global_controller.dart';
import 'package:fitness/Core/Global/Widgets/global_loading.dart';
import 'package:flutter/material.dart';

class SplashPage extends BaseView<GlobalController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Center(child: GlobalLoadingWidget(size: 75));
  }
}
