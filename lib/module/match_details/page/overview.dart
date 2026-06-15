import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/widget/o_nextmatches.dart';
import 'package:goalscore/module/match_details/widget/o_other_info.dart';
import 'package:goalscore/module/match_details/widget/o_stats.dart';
import 'package:goalscore/module/match_details/widget/o_toprated.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class Overview extends StatelessWidget {
  Overview({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Obx(() {
        return mdCtrl.isPOMDLoader.value
            ? Loader()
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.hp(0.5)),

                    // PLAYER OF THE MATCH
                    Obx(() {
                      if (mdCtrl.matchFacts.value?.playerOfTheMatch == null) return const SizedBox.shrink();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
                            child: Text("Player of the Match", style: tDmSans(context, fontWeight: FontWeight.bold)),
                          ),
                          card(
                            context: context,
                            isBoxShadow: true,
                            child: Row(
                              children: [
                                showPlayerImage(
                                  context: context,
                                  url: "${mdCtrl.matchFacts.value?.playerOfTheMatch?.id}",
                                  w: context.wp(4),
                                  h: context.wp(4),
                                ),
                                SizedBox(width: context.wp(4)),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${mdCtrl.matchFacts.value?.playerOfTheMatch?.name?.fullName}",
                                              style: tBarlow(context),
                                            ),
                                            SizedBox(height: context.hp(0.3)),
                                            Row(
                                              children: [
                                                showTeamLogo(
                                                  context: context,
                                                  url: "${mdCtrl.matchFacts.value?.playerOfTheMatch?.teamId}",
                                                  w: context.wp(1),
                                                  h: context.wp(1),
                                                ),
                                                SizedBox(width: context.wp(2)),
                                                Text(
                                                  "${mdCtrl.matchFacts.value?.playerOfTheMatch?.teamName}",
                                                  style: stDmSans(context, fontSize: context.sp(13)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.badge,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${mdCtrl.matchFacts.value?.playerOfTheMatch?.rating?.num}",
                                                    style: tDmSans(
                                                      context,
                                                      color: AppColor.bText,
                                                      fontSize: context.sp(12),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: context.wp(1)),
                                                  SvgPicture.asset(
                                                    AppAssets.star,
                                                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                                    height: context.sp(8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: context.hp(0.3)),

                                          Padding(
                                            padding: EdgeInsets.only(right: context.wp(1)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${mdCtrl.matchFacts.value?.playerOfTheMatch?.goalsCount}",
                                                  style: tDmSans(context, fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(width: context.wp(1.5)),

                                                Image.asset(AppAssets.football, scale: 50),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: context.wp(2)),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),

                    Obx(() {
                      if (mdCtrl.matchStats.value == null) return SizedBox.shrink();

                      final periodsMap = mdCtrl.matchStats.value?.periods?.data;

                      // first period after Periods
                      final firstPeriod = periodsMap?.values.first;

                      // Top stats from first period
                      final topStats = firstPeriod?.stats?.firstWhere((item) => item.key == "top_stats").stats ?? [];

                      return OStats(stats: topStats);
                    }),

                    Obx(() {
                      if (mdCtrl.matchFacts.value?.infoBox == null) return const SizedBox.shrink();
                      return OOtherInfo(data: mdCtrl.matchFacts.value?.infoBox, weatherData: mdCtrl.matchWeather.value);
                    }),
                    Obx(() {
                      if (mdCtrl.matchFacts.value?.topPlayers == null) return SizedBox.shrink();
                      return OTopRated(
                        topPlayers: mdCtrl.matchFacts.value?.topPlayers,
                        teamForm: mdCtrl.matchFacts.value?.teamForm,
                      );
                    }),
                    ONextMatches(),

                    // Obx(() {
                    //   final list = mdCtrl.nMatchesList;
                    //   if (list == null || list.isEmpty) return const SizedBox.shrink();
                    //   return ;
                    // }),

                    // Obx(() {
                    //   if (mdCtrl.possession.value == null || (mdCtrl.statisticsItems?.isEmpty ?? false)) return SizedBox.shrink();
                    //   return OStats();
                    // }),

                    // Obx(() {
                    //   final list = mdCtrl.nMatchesList;
                    //   if (list == null || list.isEmpty) return const SizedBox.shrink();
                    //   return ONextMatches(list: list);
                    // }),

                    // Obx(() {
                    //   final list = mdCtrl.rMatchesList;
                    //   if (list == null || list.isEmpty) return const SizedBox.shrink();
                    //   return ORelevantMatches(list: list);
                    // }),
                    SizedBox(height: context.hp(10)),
                  ],
                ),
              );
      }),
    );
  }
}
