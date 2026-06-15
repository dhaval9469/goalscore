import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
import 'package:goalscore/module/home/widget/match_calendar_bottomsheet.dart';
import 'package:goalscore/module/home/widget/matches_widget.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/navigation.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/routing.dart';
import 'package:goalscore/widget/image_loader.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MdCtrl mdCtrl = Get.put(MdCtrl());
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeCtrl.dates.length,
      initialIndex: homeCtrl.getTodayIndex(),
      child: Scaffold(
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          // controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColor.header,
                toolbarHeight: context.hp(5),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Matches",
                      style: tInter(context, fontWeight: FontWeight.bold, color: AppColor.bText, fontSize: context.sp(20)),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (_) => MatchCalendarBottomSheet(
                            selectedDate: homeCtrl.selectedDate,
                            onDateSelected: (date) {
                              homeCtrl.isMatchesLoader.value = true;
                              final formatted = DateFormat('yyyy-MM-dd').format(date);
                              homeCtrl.getMatches(date: formatted);
                              int tabIndex = homeCtrl.dates.indexWhere(
                                (d) => d.year == date.year && d.month == date.month && d.day == date.day,
                              );
                              if (tabIndex != -1) homeCtrl.tabController.animateTo(tabIndex);
                            },
                          ),
                        );
                      },
                      child: FaIcon(FontAwesomeIcons.solidCalendarDays, color: AppColor.bText, size: context.sp(23)),
                    ),
                  ],
                ),
                floating: true,
                snap: true,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(context.hp(4.3)),
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    controller: homeCtrl.tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColor.white,
                    labelStyle: tDmSans(context, color: AppColor.bText, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: tDmSans(
                      context,
                      color: AppColor.bsText,
                      fontSize: context.sp(14),
                      fontWeight: FontWeight.w600,
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: context.wp(1.5)),
                    padding: EdgeInsets.zero,
                    onTap: (index) {
                      DateTime selectedDate = homeCtrl.dates[index];
                      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                      homeCtrl.getMatches(date: formattedDate);
                    },
                    tabs: homeCtrl.dates.map((date) {
                      return Tab(
                        height: context.hp(4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                          child: Text(homeCtrl.label(date)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: homeCtrl.dates.map((date) {
              return Obx(
                () => homeCtrl.isMatchesLoader.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: homeCtrl.leaguesMatchList.length,
                        padding: EdgeInsets.symmetric(vertical: context.hp(2), horizontal: context.wp(3)),
                        itemBuilder: (context, index) {
                          final matches = homeCtrl.leaguesMatchList[index];

                          return Padding(
                            padding: EdgeInsets.only(bottom: context.hp(1)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.card,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: AppColor.divider),
                              ),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                tilePadding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                childrenPadding: EdgeInsets.only(
                                  left: context.wp(2),
                                  right: context.wp(2),
                                  bottom: context.hp(1),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                leading: showLeagueLogo(context: context, url: "${matches.primaryId}"),
                                title: Text(
                                  homeCtrl.getLeagueLocalizedNameById(matches.primaryId ?? 0),
                                  overflow: TextOverflow.ellipsis,
                                  style: tBarlow(context, fontWeight: FontWeight.bold, fontSize: context.sp(16)),
                                ),
                                children:
                                    matches.matches?.map<Widget>((data) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: context.hp(0.8)),
                                        child: GestureDetector(
                                          onTap: () {
                                            mdCtrl.league.value = homeCtrl.getLeagueLocalizedNameById(matches.primaryId ?? 0);
                                            mdCtrl.getNewMD(id: data.id ?? 0);
                                            mdCtrl.getNewNextMatch(
                                              homeTeamId: data.home?.id ?? 0,
                                              awayTeamId: data.away?.id ?? 0,
                                            );

                                            // mdCtrl.getPOMData(id: data.id);
                                            // mdCtrl.getMStats(id: data.id, hId: data.homeTeam?.id, aId: data.awayTeam?.id);
                                            // mdCtrl.getBestPlayer(id: data.id);
                                            // mdCtrl.getNextMatches(id: data.id);
                                            // mdCtrl.getRelevantMatches(id: data.id);
                                            // mdCtrl.getMatchIncident(id: data.id);
                                            // mdCtrl.getMatchLineup(id: data.id);
                                            // mdCtrl.getMatchCommentry(id: data.id);
                                            //
                                            Navigation.pushNamed(Routes.matchDetails);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                                            child: Row(
                                              children: [
                                                // SizedBox(
                                                //   width: context.wp(15),
                                                //   child: Center(child: matchStatusWidget(data, context)),
                                                // ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${data.home?.name}",
                                                          textAlign: TextAlign.end,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: tInter(
                                                            context,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: context.sp(14),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: context.wp(2)),
                                                      showTeamLogo(context: context, url: "${data.home?.id}"),
                                                    ],
                                                  ),
                                                ),

                                                SizedBox(
                                                  width: context.wp(20),
                                                  child: data.status?.started == false
                                                      ? Center(child: matchStatusWidget(data.status, context))
                                                      : Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "${data.home?.score}",
                                                              style: tBarlow(
                                                                context,
                                                                fontSize: context.sp(17),
                                                                fontWeight: FontWeight.w600,
                                                                color: (data.home?.score ?? 0) > (data.away?.score ?? 0)
                                                                    ? AppColor.badge
                                                                    : AppColor.text,
                                                              ),
                                                            ),
                                                            Text(
                                                              " - ",
                                                              style: tBarlow(
                                                                context,
                                                                fontWeight: FontWeight.w600,
                                                                color: AppColor.text,
                                                                fontSize: context.sp(17),
                                                              ),
                                                            ),
                                                            Text(
                                                              "${data.away?.score}",
                                                              style: tBarlow(
                                                                context,
                                                                fontSize: context.sp(17),

                                                                fontWeight: FontWeight.w600,
                                                                color: (data.away?.score ?? 0) > (data.home?.score ?? 0)
                                                                    ? AppColor.badge
                                                                    : AppColor.text,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                ),

                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      showTeamLogo(context: context, url: "${data.away?.id}"),
                                                      SizedBox(width: context.wp(2)),
                                                      Expanded(
                                                        child: Text(
                                                          "${data.away?.name}",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: tInter(
                                                            context,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: context.sp(14),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: context.hp(1));
                        },
                      ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
