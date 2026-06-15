import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/widget/match_details_widget.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';

class LineupPage extends StatelessWidget {
  LineupPage({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: context.hp(3)),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: context.wp(3)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.divider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(0.5)),
                          child: Row(children: [Text("${mdCtrl.mLineupData.value?.home?.formation}", style: tDmSans(context))]),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: context.hp(70),
                              width: context.wp(93),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AppAssets.footballField), fit: BoxFit.fill),
                              ),
                            ),
                            Positioned.fill(
                              child: Obx(
                                () => Stack(
                                  children: [
                                    ...mdCtrl.homePositions.map((p) => buildPlayer(context, p)),

                                    ...mdCtrl.awayPositions.map((p) => buildPlayer(context, p)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(0.5)),
                          child: Row(children: [Text("${mdCtrl.mLineupData.value?.away?.formation}", style: tDmSans(context))]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            headerPadding(
              context: context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  playerIn(context, size: context.sp(10)),
                  playerOut(context),
                  SizedBox(width: context.wp(1.5)),
                  Text("Substitute", style: tInter(context, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: context.hp(1)),
              itemCount: max(mdCtrl.hBenchPlayer.length, mdCtrl.aBenchPlayer.length),
              itemBuilder: (context, index) {
                final homeData = index < mdCtrl.hBenchPlayer.length ? mdCtrl.hBenchPlayer[index] : null;
                final awayData = index < mdCtrl.aBenchPlayer.length ? mdCtrl.aBenchPlayer[index] : null;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: homeData != null ? benchPlayer(context, data: homeData, isLeft: true) : Container()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                        child: VerticalDivider(indent: 3, width: 1, thickness: 1, color: AppColor.divider),
                      ),
                      Expanded(child: awayData != null ? benchPlayer(context, data: awayData) : Container()),
                    ],
                  ),
                );
              },
            ),
            headerPadding(
              context: context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(FontAwesomeIcons.briefcaseMedical, color: AppColor.sText, size: context.sp(16)),
                  SizedBox(width: context.wp(1.5)),
                  Text("Injuries", style: tInter(context, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: context.hp(1)),
              itemCount: max(mdCtrl.hInjuriesPlayer.length, mdCtrl.aInjuriesPlayer.length),
              itemBuilder: (context, index) {
                final homeData = index < mdCtrl.hInjuriesPlayer.length ? mdCtrl.hInjuriesPlayer[index] : null;
                final awayData = index < mdCtrl.aInjuriesPlayer.length ? mdCtrl.aInjuriesPlayer[index] : null;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: homeData != null ? injuriesPlayer(context, data: homeData, isLeft: true) : Container()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                        child: VerticalDivider(indent: 3, width: 1, thickness: 1, color: AppColor.divider),
                      ),
                      Expanded(child: awayData != null ? injuriesPlayer(context, data: awayData) : Container()),
                    ],
                  ),
                );
              },
            ),
            headerPadding(
              context: context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(FontAwesomeIcons.ban, color: AppColor.sText, size: context.sp(14)),
                  SizedBox(width: context.wp(1.5)),
                  Text("Suspensions", style: tInter(context, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: context.hp(1)),
              itemCount: max(mdCtrl.hSuspensionsPlayer.length, mdCtrl.aSuspensionsPlayer.length),
              itemBuilder: (context, index) {
                final homeData = index < mdCtrl.hSuspensionsPlayer.length ? mdCtrl.hSuspensionsPlayer[index] : null;
                final awayData = index < mdCtrl.aSuspensionsPlayer.length ? mdCtrl.aSuspensionsPlayer[index] : null;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: homeData != null ? injuriesPlayer(context, data: homeData, isLeft: true) : Container()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                        child: VerticalDivider(indent: 3, width: 1, thickness: 1, color: AppColor.divider),
                      ),
                      Expanded(child: awayData != null ? injuriesPlayer(context, data: awayData) : Container()),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: context.hp(8),),
          ],
        ),
      ),
    );
  }
}
