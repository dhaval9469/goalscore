import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
import 'package:goalscore/utils/routing.dart';

class GoalScoreApp extends StatefulWidget {
  const GoalScoreApp({super.key});

  @override
  State<GoalScoreApp> createState() => _GoalScoreAppState();
}

class _GoalScoreAppState extends State<GoalScoreApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      getPages: Routes.routes,
      initialRoute: Routes.homePage,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeCtrl>(HomeCtrl());
  }
}
