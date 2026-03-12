import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeCtrl.dates.length,
      initialIndex: homeCtrl.getTodayIndex(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: context.hp(6),
          backgroundColor: AppColor.header,
          title: Text(
            "Matches",
            style: tInter(context, fontWeight: FontWeight.bold, color: AppColor.bText, fontSize: context.sp(20)),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: tMontserrat(context, color: AppColor.bText, fontSize: context.sp(14), fontWeight: FontWeight.bold),
            unselectedLabelStyle: tMontserrat(
              context,
              color: AppColor.bsText,
              fontSize: context.sp(13),
              fontWeight: FontWeight.w600,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: homeCtrl.dates.map((date) {
              return Tab(text: homeCtrl.label(date));
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: homeCtrl.dates.map((date) {
            return Center(child: Text(DateFormat('yyyyMMdd').format(date)));
          }).toList(),
        ),
      ),
    );
  }
}
