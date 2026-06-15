import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/model/n_next_match_model.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';
import 'package:intl/intl.dart';

class ONextMatches extends StatelessWidget {
  ONextMatches({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    final home = mdCtrl.homeNewNextMatch.value;
    final away = mdCtrl.awayNewNextMatch.value;

    if (home == null && away == null) SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
          child: Text("Next Matches", style: tDmSans(context, fontWeight: FontWeight.bold)),
        ),
        card(
          context: context,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.hp(1)),
            child: Column(
              children: [
                home == null
                    ? SizedBox.shrink()
                    : Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  "${home.homeName}",
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                                ),
                              ),
                              SizedBox(width: context.wp(2)),
                              showTeamLogo(context: context, url: "${home.homeId}"),
                            ],
                          ),
                        ),
            
                        SizedBox(
                          width: context.wp(20),
                          child: Center(child: nextMatchStatus(home.status, context)),
                        ),
            
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              showTeamLogo(context: context, url: "${home.awayId}"),
                              SizedBox(width: context.wp(2)),
                              Expanded(
                                child: Text(
                                  "${home.awayName}",
                                  overflow: TextOverflow.ellipsis,
                                  style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                away == null
                    ? SizedBox.shrink()
                    : Divider(color: AppColor.divider,height: context.hp(3),),
                away == null
                    ? SizedBox.shrink()
                    : Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  "${away.homeName}",
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                                ),
                              ),
                              SizedBox(width: context.wp(2)),
                              showTeamLogo(context: context, url: "${away.homeId}"),
                            ],
                          ),
                        ),
            
                        SizedBox(
                          width: context.wp(20),
                          child: Center(child: nextMatchStatus(away.status, context)),
                        ),
            
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              showTeamLogo(context: context, url: "${away.awayId}"),
                              SizedBox(width: context.wp(2)),
                              Expanded(
                                child: Text(
                                  "${away.awayName}",
                                  overflow: TextOverflow.ellipsis,
                                  style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(14)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),

        /* ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ,
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
                        child: Center(
                          child: Text(
                            startTime(data.startTimestamp),
                            textAlign: TextAlign.center,
                            style: stDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(13), height: 0),
                          ),
                        ),
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
                      Text(
                        '${data.tournament?.name}',
                        textAlign: TextAlign.center,
                        style: stDmSans(context, fontSize: context.sp(13)),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: context.hp(1));
            },
          ),*/
      ],
    );
  }

  Widget nextMatchStatus(Status? status, BuildContext context) {
    if (status == null) {
      return Text(
        '-',
        style: stInter(context, fontWeight: FontWeight.w600, color: Colors.grey),
      );
    }

    final bool started = status.started ?? false;
    final bool finished = status.finished ?? false;
    final bool cancelled = status.cancelled ?? false;

    if (cancelled) {
      return Text(
        'Cancelled',
        style: stInter(context, fontWeight: FontWeight.w600, color: Colors.grey),
      );
    }

    if (finished) {
      return Text('FT', style: stInter(context, fontWeight: FontWeight.w600));
    }

    if (started) {
      return Text(
        'LIVE',
        style: tInter(context, fontWeight: FontWeight.w700, color: Colors.red),
      );
    }

    return Text(
      formatKickoffTimeFromUtc(status.utcTime),
      style: stInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(13)),
    );
  }

  String formatKickoffTimeFromUtc(String? utcTime) {
    if (utcTime == null || utcTime.isEmpty) return '-';

    try {
      final DateTime localTime = DateTime.parse(utcTime).toLocal();

      return DateFormat('h:mm a').format(localTime);
    } catch (e) {
      return '-';
    }
  }
}
