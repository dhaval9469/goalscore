import 'package:flutter/material.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';

class OStats extends StatelessWidget {
  final List<MatchStatItem>? stats;

  OStats({super.key, this.stats});

  // final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    if (stats!.isEmpty || stats == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
          child: Text("Top Stats", style: tDmSans(context, fontWeight: FontWeight.bold)),
        ),
        card(
          context: context,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.hp(0.7)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Average Possession",
                  style: stDmSans(context, fontWeight: FontWeight.w600, color: AppColor.text),
                ),
                SizedBox(height: context.hp(1)),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: stats?.length,
                  itemBuilder: (context, index) {
                    final data = stats?[index];
                    final statList = data?.stats ?? [];
            
                    final homeValue = statList.isNotEmpty ? statList[0] : 0;
                    final awayValue = statList.length > 1 ? statList[1] : 0;
            
                    final hFlex = getFlexValue(homeValue);
                    final aFlex = getFlexValue(awayValue);
                    final highlighted = data?.highlighted;
            
                    return index == 0 && data?.key == "BallPossesion"
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: hFlex,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: context.hp(3),
                                    decoration: BoxDecoration(
                                      color: homeValue > awayValue ? AppColor.badge : AppColor.redCard,
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: context.wp(2.5)),
                                          child: Text(
                                            "$homeValue%",
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            strutStyle: StrutStyle(fontSize: context.sp(13), height: 1, forceStrutHeight: true),
                                            style:
                                                tInter(
                                                  context,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: context.sp(14),
                                                  color: AppColor.bText,
                                                ).copyWith(
                                                  height: 1,
                                                  leadingDistribution: TextLeadingDistribution.even,
                                                  letterSpacing: 1,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: aFlex,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: context.hp(3),
                                    decoration: BoxDecoration(
                                      color: awayValue > homeValue ? AppColor.badge : AppColor.redCard,
                                      borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: context.wp(2.5)),
                                          child: Text(
                                            "$awayValue%",
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            strutStyle: StrutStyle(fontSize: context.sp(13), height: 1, forceStrutHeight: true),
                                            style:
                                                tInter(
                                                  context,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: context.sp(14),
                                                  color: AppColor.bText,
                                                ).copyWith(
                                                  height: 1,
                                                  leadingDistribution: TextLeadingDistribution.even,
                                                  letterSpacing: 1,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                            child: possession(
                              context: context,
                              home: getDisplayValue(homeValue),
                              title: data?.title ?? "",
                              away: getDisplayValue(awayValue),
            
                              hFlex: hFlex == 0 && aFlex == 0 ? 1 : hFlex,
                              aFlex: hFlex == 0 && aFlex == 0 ? 1 : aFlex,
            
                              hColor: highlighted == "home"
                                  ? AppColor.badge
                                  : highlighted == "equal"
                                  ? AppColor.drawBg
                                  : AppColor.redCard,
            
                              aColor: highlighted == "away"
                                  ? AppColor.badge
                                  : highlighted == "equal"
                                  ? AppColor.drawBg
                                  : AppColor.redCard,
                            ),
                          );
                  },
                ),
                /* Row(
                  children: [
                    Flexible(
                      flex: stats[0].,
                      child: Container(
                        alignment: Alignment.center,
                        height: context.hp(2),
                        decoration: BoxDecoration(
                          color: (mdCtrl.possession.value?.homeValue ?? 0) > (mdCtrl.possession.value?.awayValue ?? 0)
                              ? AppColor.badge
                              : AppColor.redCard,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: context.wp(1)),
                              child: Text(
                                "${mdCtrl.possession.value?.home}",
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
                    ),
                    SizedBox(width: context.wp(1)),
                    Flexible(
                      flex: mdCtrl.possession.value?.awayValue ?? 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: context.hp(2),
                        decoration: BoxDecoration(
                          color: (mdCtrl.possession.value?.awayValue ?? 0) > (mdCtrl.possession.value?.homeValue ?? 0)
                              ? AppColor.badge
                              : AppColor.redCard,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: context.wp(1)),
                              child: Text(
                                "${mdCtrl.possession.value?.away}",
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
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),

        /*       if ((mdCtrl.statisticsItems?.length ?? 0) > 1)
          possession(
            context: context,
            home: "${mdCtrl.statisticsItems?[1].home}",
            title: "Total Shots",
            away: "${mdCtrl.statisticsItems?[1].away}",
            hFlex: mdCtrl.statisticsItems?[1].homeValue ?? 0,
            aFlex: mdCtrl.statisticsItems?[1].awayValue ?? 0,
            hColor: (mdCtrl.statisticsItems?[1].homeValue ?? 0) > (mdCtrl.statisticsItems?[1].awayValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
            aColor: (mdCtrl.statisticsItems?[1].awayValue ?? 0) > (mdCtrl.statisticsItems?[1].homeValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
          ),
        if ((mdCtrl.statisticsItems?.length ?? 0) > 2)
          possession(
            context: context,
            home: "${mdCtrl.statisticsItems?[2].home}",
            title: "Shots on Target",
            away: "${mdCtrl.statisticsItems?[2].away}",
            hFlex: mdCtrl.statisticsItems?[2].homeValue ?? 0,
            aFlex: mdCtrl.statisticsItems?[2].awayValue ?? 0,
            hColor: (mdCtrl.statisticsItems?[2].homeValue ?? 0) > (mdCtrl.statisticsItems?[2].awayValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
            aColor: (mdCtrl.statisticsItems?[2].awayValue ?? 0) > (mdCtrl.statisticsItems?[2].homeValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
          ),
        if ((mdCtrl.statisticsItems?.length ?? 0) > 4)
          possession(
            context: context,
            home: "${mdCtrl.statisticsItems?[4].home}",
            title: "Corner Kicks",
            away: "${mdCtrl.statisticsItems?[4].away}",
            hFlex: mdCtrl.statisticsItems?[4].homeValue ?? 0,
            aFlex: mdCtrl.statisticsItems?[4].awayValue ?? 0,
            hColor: (mdCtrl.statisticsItems?[4].homeValue ?? 0) > (mdCtrl.statisticsItems?[4].awayValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
            aColor: (mdCtrl.statisticsItems?[4].awayValue ?? 0) > (mdCtrl.statisticsItems?[4].homeValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
          ),
        if ((mdCtrl.statisticsItems?.length ?? 0) > 11)
          possession(
            context: context,
            home: "${mdCtrl.statisticsItems?[11].home}",
            title: "Yellow Cards",
            away: "${mdCtrl.statisticsItems?[11].away}",
            hFlex: mdCtrl.statisticsItems?[11].homeValue ?? 0,
            aFlex: mdCtrl.statisticsItems?[11].awayValue ?? 0,
            hColor: (mdCtrl.statisticsItems?[11].homeValue ?? 0) > (mdCtrl.statisticsItems?[11].awayValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
            aColor: (mdCtrl.statisticsItems?[11].awayValue ?? 0) > (mdCtrl.statisticsItems?[11].homeValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
          ),
        if ((mdCtrl.statisticsItems?.length ?? 0) > 10)
          possession(
            context: context,
            home: "${mdCtrl.statisticsItems?[10].home}",
            title: "Red Cards",
            away: "${mdCtrl.statisticsItems?[10].away}",
            hFlex: mdCtrl.statisticsItems?[10].homeValue ?? 0,
            aFlex: mdCtrl.statisticsItems?[10].awayValue ?? 0,
            hColor: (mdCtrl.statisticsItems?[10].homeValue ?? 0) > (mdCtrl.statisticsItems?[10].awayValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
            aColor: (mdCtrl.statisticsItems?[10].awayValue ?? 0) > (mdCtrl.statisticsItems?[10].homeValue ?? 0)
                ? AppColor.badge
                : AppColor.redCard,
          ),*/
      ],
    );
    /* return card(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
            child: Text("Top Stats", style: tDmSans(context, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: context.hp(0.3)),
          Row(
            children: [
              Flexible(
                flex: mdCtrl.possession.value?.homeValue ?? 0,
                child: Container(
                  alignment: Alignment.center,
                  height: context.hp(2),
                  decoration: BoxDecoration(
                    color: (mdCtrl.possession.value?.homeValue ?? 0) > (mdCtrl.possession.value?.awayValue ?? 0)
                        ? AppColor.badge
                        : AppColor.redCard,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: context.wp(1)),
                        child: Text(
                          "${mdCtrl.possession.value?.home}",
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
              ),
              SizedBox(width: context.wp(0.7)),
              Flexible(
                flex: mdCtrl.possession.value?.awayValue ?? 0,
                child: Container(
                  alignment: Alignment.center,
                  height: context.hp(2),
                  decoration: BoxDecoration(
                    color: (mdCtrl.possession.value?.awayValue ?? 0) > (mdCtrl.possession.value?.homeValue ?? 0)
                        ? AppColor.badge
                        : AppColor.redCard,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.wp(1)),
                        child: Text(
                          "${mdCtrl.possession.value?.away}",
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
              ),
            ],
          ),
          if ((mdCtrl.statisticsItems?.length ?? 0) > 1)
            possession(
              context: context,
              home: "${mdCtrl.statisticsItems?[1].home}",
              title: "Total Shots",
              away: "${mdCtrl.statisticsItems?[1].away}",
              hFlex: mdCtrl.statisticsItems?[1].homeValue ?? 0,
              aFlex: mdCtrl.statisticsItems?[1].awayValue ?? 0,
              hColor: (mdCtrl.statisticsItems?[1].homeValue ?? 0) > (mdCtrl.statisticsItems?[1].awayValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
              aColor: (mdCtrl.statisticsItems?[1].awayValue ?? 0) > (mdCtrl.statisticsItems?[1].homeValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
            ),
          if ((mdCtrl.statisticsItems?.length ?? 0) > 2)
            possession(
              context: context,
              home: "${mdCtrl.statisticsItems?[2].home}",
              title: "Shots on Target",
              away: "${mdCtrl.statisticsItems?[2].away}",
              hFlex: mdCtrl.statisticsItems?[2].homeValue ?? 0,
              aFlex: mdCtrl.statisticsItems?[2].awayValue ?? 0,
              hColor: (mdCtrl.statisticsItems?[2].homeValue ?? 0) > (mdCtrl.statisticsItems?[2].awayValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
              aColor: (mdCtrl.statisticsItems?[2].awayValue ?? 0) > (mdCtrl.statisticsItems?[2].homeValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
            ),
          if ((mdCtrl.statisticsItems?.length ?? 0) > 4)
            possession(
              context: context,
              home: "${mdCtrl.statisticsItems?[4].home}",
              title: "Corner Kicks",
              away: "${mdCtrl.statisticsItems?[4].away}",
              hFlex: mdCtrl.statisticsItems?[4].homeValue ?? 0,
              aFlex: mdCtrl.statisticsItems?[4].awayValue ?? 0,
              hColor: (mdCtrl.statisticsItems?[4].homeValue ?? 0) > (mdCtrl.statisticsItems?[4].awayValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
              aColor: (mdCtrl.statisticsItems?[4].awayValue ?? 0) > (mdCtrl.statisticsItems?[4].homeValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
            ),
          if ((mdCtrl.statisticsItems?.length ?? 0) > 11)
            possession(
              context: context,
              home: "${mdCtrl.statisticsItems?[11].home}",
              title: "Yellow Cards",
              away: "${mdCtrl.statisticsItems?[11].away}",
              hFlex: mdCtrl.statisticsItems?[11].homeValue ?? 0,
              aFlex: mdCtrl.statisticsItems?[11].awayValue ?? 0,
              hColor: (mdCtrl.statisticsItems?[11].homeValue ?? 0) > (mdCtrl.statisticsItems?[11].awayValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
              aColor: (mdCtrl.statisticsItems?[11].awayValue ?? 0) > (mdCtrl.statisticsItems?[11].homeValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
            ),
          if ((mdCtrl.statisticsItems?.length ?? 0) > 10)
            possession(
              context: context,
              home: "${mdCtrl.statisticsItems?[10].home}",
              title: "Red Cards",
              away: "${mdCtrl.statisticsItems?[10].away}",
              hFlex: mdCtrl.statisticsItems?[10].homeValue ?? 0,
              aFlex: mdCtrl.statisticsItems?[10].awayValue ?? 0,
              hColor: (mdCtrl.statisticsItems?[10].homeValue ?? 0) > (mdCtrl.statisticsItems?[10].awayValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
              aColor: (mdCtrl.statisticsItems?[10].awayValue ?? 0) > (mdCtrl.statisticsItems?[10].homeValue ?? 0)
                  ? AppColor.badge
                  : AppColor.redCard,
            ),
        ],
      ),
    );*/
  }

  Widget possession({
    required BuildContext context,
    String? home,
    String? title,
    String? away,
    required int hFlex,
    required int aFlex,
    Color? hColor,
    Color? aColor,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: context.hp(1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$home",
            style: stBarlow(context, fontWeight: FontWeight.bold, color: AppColor.text, fontSize: context.sp(15)),
          ),
          Text(
            "$title",
            style: stDmSans(context, fontWeight: FontWeight.w600, color: AppColor.text),
          ),
          Text(
            "$away",
            style: stBarlow(context, fontWeight: FontWeight.bold, color: AppColor.text, fontSize: context.sp(15)),
          ),
        ],
      ),
    );
  }

  int getFlexValue(dynamic value) {
    if (value == null) return 0;

    if (value is int) return value;
    if (value is double) return (value * 100).toInt();

    if (value is String) {
      // For "1.37"
      final doubleValue = double.tryParse(value);
      if (doubleValue != null) {
        return (doubleValue * 100).toInt();
      }

      // For "279 (79%)"
      final number = RegExp(r'\d+').firstMatch(value)?.group(0);
      return int.tryParse(number ?? "0") ?? 0;
    }

    return 0;
  }

  String getDisplayValue(dynamic value) {
    if (value == null) return "0";
    return value.toString();
  }
}
