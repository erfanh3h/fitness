import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Global/Widgets/global_loading.dart';
import '../Resources/app_colors.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  const BaseView({final Key? key}) : super(key: key);

  AppBar? appBar(final BuildContext context) {
    return null;
  }

  GlobalKey<ScaffoldState>? setScaffoldKey({GlobalKey<ScaffoldState>? value}) {
    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    if (value != null) {
      globalKey = value;
    }
    return globalKey;
  }

  // You can Override it
  bool safeArea() {
    return false;
  }

  // You can Override it
  bool resizeToAvoidBottomInset() {
    return false;
  }

  // this use to determine we need willpop scope or not(in ios onwill popscope wont work)
  bool setWillPopScope() {
    return false;
  }

  Future<bool> onWillPop() async {
    return true;
  }

  // this use to seperate type of bodies
  bool isSingleBody() {
    return true;
  }

  bool extendBodyBehindNavigationBar() {
    return false;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  Widget body(final BuildContext context);
  Widget tabletBody(final BuildContext context) => body(context);
  Widget webBody(final BuildContext context) => body(context);

  @override
  Widget build(final BuildContext context) {
    return pageContent(context);
  }

  Widget pageScaffold(final BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: pageBackgroundColor(),
        key: setScaffoldKey(),
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: floatingActionButtonLocation(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        extendBody: extendBodyBehindNavigationBar(),
        body: controller.isPageLoading.value ? _showLoading() : body(context),
        drawer: drawer(),
        endDrawer: endDrawer(),
        bottomNavigationBar: bottomNavigationBar(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      ),
    );
  }

  Widget pageContent(final BuildContext context) {
    return safeArea()
        ? SafeArea(
            child: pageScaffold(context),
          )
        : setWillPopScope()
            ? WillPopScope(
                child: pageScaffold(context), onWillPop: () => onWillPop())
            : pageScaffold(context);
  }

  Widget showErrorSnackBar(final String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container(
      color: AppColors.background,
    );
  }

  Color pageBackgroundColor() {
    return AppColors.background;
  }

  Color statusBarColor() {
    return Colors.transparent;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget? endDrawer() {
    return null;
  }

  Widget _showLoading() {
    return const GlobalLoadingWidget(
      color: Colors.black,
    );
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }
}
