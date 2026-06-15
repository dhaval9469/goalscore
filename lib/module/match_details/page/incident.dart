import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/widget/match_details_widget.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class IncidentPage extends StatelessWidget {
  IncidentPage({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Obx(() {
        if (mdCtrl.isMIncident.value) return const Loader();
        if (mdCtrl.mIncidentData.value == null) return const SizedBox.shrink();
        return ListView.builder(
          shrinkWrap: true,
          itemCount: mdCtrl.mIncidentData.value?.incidents?.length,
          itemBuilder: (context, index) {
            final data = mdCtrl.mIncidentData.value?.incidents?[index];
            return data?.incidentType == "period"
                ? Column(
                    children: [
                      data?.text != "HT"
                          ? SizedBox.shrink()
                          : Container(width: 1, height: context.hp(1.5), color: AppColor.divider),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColor.divider.withValues(alpha: 0.0),
                                    AppColor.divider.withValues(alpha: 0.3),
                                    AppColor.divider.withValues(alpha: 0.7),
                                    AppColor.divider,
                                  ],
                                  stops: [0.0, 0.3, 0.7, 1.0],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: BoxBorder.all(color: AppColor.bDivider),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                              child: Row(
                                children: [
                                  Text(
                                    "${data?.homeScore}",
                                    style: tDmSans(
                                      context,
                                      color: (data?.homeScore ?? 0) > (data?.awayScore ?? 0) ? AppColor.badge : AppColor.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: context.sp(18),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: context.wp(3), vertical: context.hp(0.5)),
                                    child: Text(
                                      "${data?.text}",
                                      style: stDmSans(context, fontSize: context.sp(15), fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "${data?.awayScore}",
                                    style: tDmSans(
                                      context,
                                      color: (data?.awayScore ?? 0) > (data?.homeScore ?? 0) ? AppColor.badge : AppColor.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: context.sp(18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColor.divider,
                                    AppColor.divider.withValues(alpha: 0.7),
                                    AppColor.divider.withValues(alpha: 0.3),
                                    AppColor.divider.withValues(alpha: 0.0),
                                  ],
                                  stops: [0.0, 0.3, 0.7, 1.0],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(width: 1, height: context.hp(1.5), color: AppColor.divider),
                    ],
                  )
                : data?.length != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.wp(1)),
                    child: Column(
                      children: [
                        Container(width: 1, height: context.hp(1.3), color: AppColor.divider),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.sText.withValues(alpha: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2.5), vertical: context.hp(0.3)),
                            child: Text(
                              "+ ${data?.length}' minutes added",
                              overflow: TextOverflow.ellipsis,
                              style: tDmSans(context),
                            ),
                          ),
                        ),
                        Container(width: 1, height: context.hp(1.3), color: AppColor.divider),
                      ],
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: data?.isHome == true
                            ? data?.incidentType == "substitution"
                                  ? Padding(
                                      padding: EdgeInsets.only(left: context.wp(2)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    playerIn(context),
                                                    SizedBox(width: context.wp(1)),
                                                    Flexible(
                                                      child: Text(
                                                        "${data?.playerIn?.name}",
                                                        overflow: TextOverflow.ellipsis,
                                                        style: tInter(context, fontSize: context.sp(14)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    playerOut(context),
                                                    SizedBox(width: context.wp(1)),
                                                    Text(
                                                      "${data?.playerOut?.name}",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: stDmSans(context, fontSize: context.sp(12), height: 0),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: context.wp(1)),
                                          showPlayerImage(context: context, url: "", h: context.wp(2), w: context.wp(2)),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(left: context.wp(2)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          data?.incidentClass?.toLowerCase() == "yellowred"
                                              ? Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    yellowCard(context),
                                                    Positioned(left: context.wp(1.5), child: redCard(context)),
                                                  ],
                                                )
                                              : data?.incidentClass?.toLowerCase() == "yellow"
                                              ? yellowCard(context)
                                              : data?.incidentClass?.toLowerCase() == "red"
                                              ? redCard(context)
                                              : SizedBox.shrink(),
                                          SizedBox(width: context.wp(1.5)),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${data?.player?.name}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: tInter(context, fontSize: context.sp(14), height: 1),
                                                ),
                                                data?.assist1?.name == ""
                                                    ? SizedBox.shrink()
                                                    : Text(
                                                        "${data?.assist1?.name}",
                                                        overflow: TextOverflow.ellipsis,
                                                        style: stDmSans(context, fontSize: context.sp(12), height: 0),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: context.wp(1)),
                                          showPlayerImage(context: context, url: "", h: context.wp(2.3), w: context.wp(2.3)),
                                          data?.incidentType == "goal"
                                              ? Image.asset(AppAssets.football, scale: 35)
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    )
                            : SizedBox(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.wp(1)),
                        child: Column(
                          children: [
                            Container(width: 1, height: context.hp(1.3), color: AppColor.divider),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColor.sText),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.wp(2.5), vertical: context.hp(0.3)),
                                child: Row(
                                  children: [
                                    Text(
                                      "${data?.time}'",
                                      overflow: TextOverflow.ellipsis,
                                      style: tBarlow(context, color: AppColor.bText, fontWeight: FontWeight.w600),
                                    ),
                                    data?.addedTime != null
                                        ? Text(
                                            " + ${data?.addedTime}'",
                                            overflow: TextOverflow.ellipsis,
                                            style: tBarlow(context, color: AppColor.bText, fontWeight: FontWeight.w600),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ),
                            Container(width: 1, height: context.hp(1.3), color: AppColor.divider),
                          ],
                        ),
                      ),
                      Expanded(
                        child: data?.isHome == false
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: data?.incidentType == "substitution"
                                    ? Row(
                                        children: [
                                          showPlayerImage(context: context, url: "", h: context.wp(2), w: context.wp(2)),
                                          SizedBox(width: context.wp(1)),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        "${data?.playerIn?.name}",
                                                        overflow: TextOverflow.ellipsis,
                                                        style: tInter(context, fontSize: context.sp(14)),
                                                      ),
                                                    ),
                                                    SizedBox(width: context.wp(1)),
                                                    playerIn(context),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${data?.playerOut?.name}",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: stDmSans(context, fontSize: context.sp(12), height: 0),
                                                    ),
                                                    SizedBox(width: context.wp(1)),
                                                    playerOut(context),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          data?.incidentType == "goal"
                                              ? Image.asset(AppAssets.football, scale: 35)
                                              : SizedBox.shrink(),
                                          showPlayerImage(context: context, url: "", h: context.wp(2), w: context.wp(2)),
                                          SizedBox(width: context.wp(1)),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data?.player?.name}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: tInter(context, fontSize: context.sp(14)),
                                                ),
                                                data?.assist1?.name == ""
                                                    ? SizedBox.shrink()
                                                    : Text(
                                                        "assist: ${data?.assist1?.name}",
                                                        overflow: TextOverflow.ellipsis,
                                                        style: stDmSans(context, fontSize: context.sp(12), height: 0),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: context.wp(1.5)),
                                          data?.incidentClass?.toLowerCase() == "yellowred"
                                              ? Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    yellowCard(context),
                                                    Positioned(left: context.wp(1.5), child: redCard(context)),
                                                  ],
                                                )
                                              : data?.incidentClass?.toLowerCase() == "yellow"
                                              ? yellowCard(context)
                                              : data?.incidentClass?.toLowerCase() == "red"
                                              ? redCard(context)
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                              )
                            : SizedBox(),
                      ),
                    ],
                  );
          },
        );
      }),
    );
  }
}
