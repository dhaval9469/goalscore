import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:intl/intl.dart';

class DateCalendar extends StatelessWidget {
  DateCalendar({super.key});

  final homeCtrl = Get.find<HomeCtrl>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = homeCtrl.dates.indexWhere((d) => homeCtrl.isSame(d, homeCtrl.today));

      if (index != -1 && scrollController.hasClients) {
        double itemWidth = context.wp(21.3);
        double screenWidth = MediaQuery.of(context).size.width;

        double scrollOffset = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

        scrollController.jumpTo(
          scrollOffset.clamp(scrollController.position.minScrollExtent, scrollController.position.maxScrollExtent),
        );
      }
    });
    return SizedBox(
      height: context.hp(6),
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: homeCtrl.dates.length,
        itemBuilder: (context, index) {
          DateTime date = homeCtrl.dates[index];

          return Obx(() {
            bool selected = homeCtrl.isSame(date, homeCtrl.selectedDate.value);

            return GestureDetector(
              onTap: () {
                homeCtrl.selectDate(date);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: selected ? AppColor.sText : Colors.transparent),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homeCtrl.label(date),
                        style: selected
                            ? tMontserrat(context, color: AppColor.bText, fontSize: context.sp(13), fontWeight: FontWeight.w800)
                            : tMontserrat(context, color: AppColor.bsText, fontSize: context.sp(13), fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat("dd MMM").format(date),
                        style: tMontserrat(
                          context,
                          color: AppColor.bsText,
                          fontSize: context.sp(12),
                          fontWeight: FontWeight.w600,
                        ), // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: selected ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox.shrink();
        },
      ),
    );
  }
}
