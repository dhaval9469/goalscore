import 'package:flutter/material.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class OTopRated extends StatelessWidget {
  final TopPlayers? topPlayers;
  final List<List<MFTeamForm>>? teamForm;

  const OTopRated({super.key, this.topPlayers, this.teamForm});

  @override
  Widget build(BuildContext context) {
    final homePlayers = topPlayers?.homeTopPlayers ?? [];
    final awayPlayers = topPlayers?.awayTopPlayers ?? [];
    final homeTeamForm = teamForm?.first;
    final awayTeamForm = teamForm?.last;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
          child: Text("Top Rated", style: tDmSans(context, fontWeight: FontWeight.bold)),
        ),
        card(
          context: context,
          child: Column(
            children: List.generate(
              homePlayers.length.clamp(0, awayPlayers.length),
              (index) => buildPlayerRow(context: context, home: homePlayers[index], away: awayPlayers[index]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(context.wp(4), context.hp(1.5), context.wp(4), context.hp(0.5)),
          child: Text("Team From", style: tDmSans(context, fontWeight: FontWeight.bold)),
        ),
        card(
          context: context,
          child: Column(
            children: List.generate(
              homeTeamForm!.length.clamp(0, awayTeamForm!.length),
              (index) => buildTeamRow(context: context, home: homeTeamForm[index], away: awayTeamForm[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPlayerRow({required BuildContext context, required TopPlayer home, required TopPlayer away}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.hp(1), horizontal: context.wp(1.5)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showPlayerImage(context: context, url: '${home.playerId}'),
                SizedBox(width: context.wp(1.5)),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home.name?.lastName ?? "",
                        style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(13)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: context.hp(0.3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: AppColor.badge, borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.wp(1)),
                              child: Text(
                                "${home.playerRating}",
                                style: tDmSans(context, fontSize: context.sp(11), color: AppColor.bText),
                              ),
                            ),
                          ),
                          /*                          home.goals == 0
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: EdgeInsets.only(left: context.wp(2)),
                                  child: Row(
                                    children: [
                                      Image.asset(AppAssets.football, scale: 50),
                                      SizedBox(width: context.wp(1)),
                                      Text("${home.goals}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    ],
                                  ),
                                ),
                          home.assists == 0
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: EdgeInsets.only(left: context.wp(2)),
                                  child: Row(
                                    children: [
                                      Icon(Icons.assistant, size: context.sp(14), color: AppColor.sText),
                                      SizedBox(width: context.wp(1)),
                                      Text("${home.assists}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    ],
                                  ),
                                ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        away.name?.lastName ?? "",
                        style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(13)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: context.hp(0.3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: AppColor.badge, borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.wp(1)),
                              child: Text(
                                "${away.playerRating}",
                                style: tDmSans(context, fontSize: context.sp(11), color: AppColor.bText),
                              ),
                            ),
                          ),
                          /*                          home.goals == 0
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: EdgeInsets.only(left: context.wp(2)),
                                  child: Row(
                                    children: [
                                      Image.asset(AppAssets.football, scale: 50),
                                      SizedBox(width: context.wp(1)),
                                      Text("${home.goals}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    ],
                                  ),
                                ),
                          home.assists == 0
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: EdgeInsets.only(left: context.wp(2)),
                                  child: Row(
                                    children: [
                                      Icon(Icons.assistant, size: context.sp(14), color: AppColor.sText),
                                      SizedBox(width: context.wp(1)),
                                      Text("${home.assists}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    ],
                                  ),
                                ),*/
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.wp(1.5)),
                showPlayerImage(context: context, url: '${away.playerId}'),
              ],
            ),
          ),
          /*     Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      away.name?.lastName ?? "",
                      style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(13)),
                      overflow: TextOverflow.ellipsis,
                    ),
                       */
          /*               SizedBox(height: context.hp(0.3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        home.assists == 0
                            ? SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.only(right: context.wp(2)),
                                child: Row(
                                  children: [
                                    Text("${home.assists}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    SizedBox(width: context.wp(1)),
                                    Icon(Icons.assistant, size: context.sp(14), color: AppColor.sText),
                                  ],
                                ),
                              ),
                        home.goals == 0
                            ? SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.only(right: context.wp(2)),
                                child: Row(
                                  children: [
                                    Text("${home.goals}", style: tDmSans(context, fontWeight: FontWeight.w600, height: 1)),
                                    SizedBox(width: context.wp(1)),
                                    Image.asset(AppAssets.football, scale: 50),
                                  ],
                                ),
                              ),
                        Container(
                          decoration: BoxDecoration(color: AppColor.badge, borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                            child: Text(
                              "${home.value}",
                              style: tDmSans(context, fontSize: context.sp(12), color: AppColor.bText),
                            ),
                          ),
                        ),
                      ],
                    ),*/
          /*
                  ],
                ),
                SizedBox(width: context.wp(1)),
                playerImage(context: context, url: ''),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget buildTeamRow({required BuildContext context, required MFTeamForm home, required MFTeamForm away}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.hp(1), horizontal: context.wp(1.5)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showTeamLogo(context: context, url: '${home.home?.id}', h: context.wp(1.7), w: context.wp(1.7)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(2.3)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: home.result == 0
                          ? AppColor.drawBg
                          : home.result == 1
                          ? AppColor.winBg
                          : AppColor.lossBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(0.2)),
                      child: Text(
                        "${home.score}",
                        style: tBarlow(context, fontSize: context.sp(13), color: AppColor.bText, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                showTeamLogo(context: context, url: '${home.away?.id}', h: context.wp(1.7), w: context.wp(1.7)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                showTeamLogo(context: context, url: '${away.home?.id}', h: context.wp(1.7), w: context.wp(1.7)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(2.3)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: away.result == 0
                          ? AppColor.drawBg
                          : away.result == 1
                          ? AppColor.winBg
                          : AppColor.lossBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.wp(2), vertical: context.hp(0.2)),
                      child: Text(
                        "${away.score}",
                        style: tBarlow(context, fontSize: context.sp(13), color: AppColor.bText, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                showTeamLogo(context: context, url: '${away.away?.id}', h: context.wp(1.7), w: context.wp(1.7)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
