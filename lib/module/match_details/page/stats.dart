import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/widget/match_details_widget.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';

class StatsPage extends StatelessWidget {
  StatsPage({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: context.hp(2)),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    statsItem(
                      context,
                      text: "All",
                      isSelected: mdCtrl.sStatsIndex.value == 0,
                      onTap: () {
                        mdCtrl.sStatsIndex.value = 0;
                        mdCtrl.statsChange(state: "all");
                      },
                    ),
                    statsItem(
                      context,
                      text: "1ST",
                      isSelected: mdCtrl.sStatsIndex.value == 1,
                      onTap: () {
                        mdCtrl.sStatsIndex.value = 1;
                        mdCtrl.statsChange(state: "1st");
                      },
                    ),
                    statsItem(
                      context,
                      text: "2ND",
                      isSelected: mdCtrl.sStatsIndex.value == 2,
                      onTap: () {
                        mdCtrl.sStatsIndex.value = 2;
                        mdCtrl.statsChange(state: "2nd");
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.hp(3)),
            Center(
              child: Text(
                "Ball Possession",
                style: stInter(context, fontWeight: FontWeight.w600, color: AppColor.text),
              ),
            ),
            SizedBox(height: context.hp(0.5)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final home = (mdCtrl.sPossession.value?.homeValue ?? 0).toDouble();
                  final away = (mdCtrl.sPossession.value?.awayValue ?? 0).toDouble();

                  final total = (home + away) == 0 ? 1 : (home + away);

                  final homeWidth = (home / total) * constraints.maxWidth;
                  final awayWidth = (away / total) * constraints.maxWidth;

                  return Obx(
                    () => Row(
                      children: [
                        /// HOME
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          width: homeWidth,
                          height: context.hp(2),
                          decoration: BoxDecoration(
                            color: home > away ? AppColor.badge : AppColor.redCard,
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: context.wp(1)),
                                child: Text(
                                  "${mdCtrl.sPossession.value?.home}",
                                  style: tBarlow(
                                    context,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.sp(10),
                                    color: AppColor.bText,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// AWAY
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          width: awayWidth,
                          height: context.hp(2),
                          decoration: BoxDecoration(
                            color: away > home ? AppColor.badge : AppColor.redCard,
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: context.wp(1)),
                                child: Text(
                                  "${mdCtrl.sPossession.value?.away}",
                                  style: tBarlow(
                                    context,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.sp(10),
                                    color: AppColor.bText,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(1.5)),
                child: Container(
                  decoration: BoxDecoration(color: AppColor.divider, borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(right: context.wp(2), left: context.wp(2), bottom: context.hp(1.5)),
                    itemCount: mdCtrl.mAllStatsData.value?.groups?[0].statisticsItems?.length,
                    itemBuilder: (context, index) {
                      final data = mdCtrl.mAllStatsData.value?.groups?[0].statisticsItems?[index];
                      return sPossessionWidget(
                        context: context,
                        title: "${data?.name}",
                        home: "${data?.home}",
                        away: "${data?.away}",
                        hFlex: data?.homeValue ?? 0,
                        aFlex: data?.awayValue ?? 0,
                        hColor: (data?.homeValue ?? 0) > (data?.awayValue ?? 0) ? AppColor.badge : AppColor.redCard,
                        aColor: (data?.awayValue ?? 0) > (data?.homeValue ?? 0) ? AppColor.badge : AppColor.redCard,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
