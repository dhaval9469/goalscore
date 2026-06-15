import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/model/m_relevant_matches_m.dart';
import 'package:goalscore/module/match_details/widget/match_details_widget.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class ORelevantMatches extends StatelessWidget {
  final List<RMData> list;

  ORelevantMatches({super.key, required this.list});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerPadding(
          context: context,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Relevant Matches", style: tInter(context, fontWeight: FontWeight.w600))],
          ),
        ),

        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final data = list[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColor.card,
                borderRadius: BorderRadius.circular(10),
                border: BoxBorder.all(color: AppColor.divider),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: context.wp(2), top: context.hp(0.8), bottom: context.hp(0.8)),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.wp(18),
                      child: Center(child: rMSWidget(data, context)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            showTeamLogo(context: context, url: "", h: context.wp(1.4), w: context.wp(1.4)),
                            SizedBox(width: context.wp(2)),
                            Text(
                              "${data.homeTeam?.shortName}",
                              overflow: TextOverflow.ellipsis,
                              style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                            ),
                          ],
                        ),
                        SizedBox(height: context.hp(0.5)),
                        Row(
                          children: [
                            showTeamLogo(context: context, url: "", h: context.wp(1.4), w: context.wp(1.4)),
                            SizedBox(width: context.wp(2)),
                            Text(
                              "${data.awayTeam?.shortName}",
                              overflow: TextOverflow.ellipsis,
                              style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        data.homeScore?.display != null
                            ? Text(
                                "${data.homeScore?.display}",
                                style: tBarlow(
                                  context,
                                  fontWeight: FontWeight.w600,
                                  color: (data.homeScore?.display ?? 0) > (data.awayScore?.display ?? 0)
                                      ? AppColor.badge
                                      : AppColor.text,
                                ),
                              )
                            : SizedBox.shrink(),
                        data.awayScore?.display != null
                            ? Text(
                                "${data.awayScore?.display}",
                                style: tBarlow(
                                  context,
                                  fontWeight: FontWeight.w600,
                                  color: (data.awayScore?.display ?? 0) > (data.homeScore?.display ?? 0)
                                      ? AppColor.badge
                                      : AppColor.text,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    SizedBox(width: context.wp(2)),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: context.hp(1));
          },
        ),
      ],
    );
  }
}
