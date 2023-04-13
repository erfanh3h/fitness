import 'package:fitness/Core/Global/Widgets/global_loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Controllers/global_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key

  bool isInit = true;
  bool isLoggedIn = false;
  // int _selectedIndex = 0;
  // PageController pgCtrl = PageController();
  final controller = Get.find<GlobalController>();

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press back again . . .');
      return Future.value(false);
    }
    return false;
  }

  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isInit
        ? const Center(
            child: GlobalLoadingWidget(),
          )
        : SafeArea(
            child: WillPopScope(
              onWillPop: onWillPop,
              child: Scaffold(
                key: scaffoldKey,
                body: Container(),
              ),
            ),
          );
  }
}
