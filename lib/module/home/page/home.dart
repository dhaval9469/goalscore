import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
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
  late ScrollController _scrollController;
  final MdCtrl mdCtrl = Get.put(MdCtrl());
  final homeCtrl = Get.find<HomeCtrl>();
  bool _isTitleVisible = true;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

  }

  void _onScroll() {
    final offset = _scrollController.offset;

    // Hide title when scrolled past 50px
    final shouldShow = offset < 40;

    if (shouldShow != _isTitleVisible) {
      setState(() => _isTitleVisible = shouldShow);
    }

    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer(const Duration(seconds: 3), _scrollBackToTop);
  }

  void _scrollBackToTop() {
    if (_scrollController.offset > 0) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeCtrl.dates.length,
      initialIndex: homeCtrl.getTodayIndex(),
      child: Scaffold(
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColor.header,
                toolbarHeight: context.hp(5),
                title: AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  offset: _isTitleVisible ? Offset.zero : const Offset(0, -1),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    opacity: _isTitleVisible ? 1.0 : 0.0,
                    child: Text(
                      "Matches",
                      style: tInter(
                        context,
                        fontWeight: FontWeight.bold,
                        color: AppColor.bText,
                        fontSize: context.sp(20),
                      ),
                    ),
                  ),
                ),
                floating: true,
                snap: true,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(context.hp(4.3)),
                  child: TabBar(
                    controller: homeCtrl.tabController,
                    isScrollable: true,

                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColor.white,
                    labelStyle: tMontserrat(context, color: AppColor.bText, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: tMontserrat(
                      context,
                      color: AppColor.bsText,
                      fontSize: context.sp(14),
                      fontWeight: FontWeight.w600,
                    ),

                    labelPadding: EdgeInsets.symmetric(horizontal: context.wp(1.5)),
                    padding: EdgeInsets.zero,
                    onTap: (index) {
                      DateTime selectedDate = homeCtrl.dates[index];
                      String formattedDate = DateFormat('yyyyMMdd').format(selectedDate);

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
                        // shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: homeCtrl.leaguesList.length,
                        padding: EdgeInsets.symmetric(vertical: context.hp(2), horizontal: context.wp(3)),
                        itemBuilder: (context, index) {
                          final data = homeCtrl.leaguesList[index];
                          return Obx(
                            () => ExpansionTile(
                              onExpansionChanged: (value) {
                                homeCtrl.isExpanded.value = value;
                                homeCtrl.eIndex.value = index;
                              },
                              backgroundColor: AppColor.card,
                              collapsedBackgroundColor: AppColor.card,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: AppColor.divider),
                              ),
                              collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: AppColor.divider),
                              ),
                              expansionAnimationStyle: const AnimationStyle(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.easeInOutCubic,
                              ),
                              minTileHeight: context.hp(6),
                              childrenPadding: EdgeInsets.zero,
                              tilePadding: EdgeInsets.only(right: context.wp(1.5), left: context.wp(3)),
                              showTrailingIcon: false,
                              title: Row(
                                children: [
                                  showFlagImage(
                                    context: context,
                                    url: "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/${data.primaryId}.png",
                                  ),
                                  SizedBox(width: context.wp(2)),

                                  Expanded(
                                    child: Text(
                                      "${data.name}",
                                      overflow: TextOverflow.ellipsis,
                                      style: tInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(16)),
                                    ),
                                  ),
                                  SizedBox(width: context.wp(2)),
                                  Container(
                                    width: context.wp(7),
                                    height: context.hp(3.5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: AppColor.sCard, borderRadius: BorderRadius.circular(6)),
                                    child: Text(
                                      "${data.matches?.length}",
                                      style: tInter(context, color: AppColor.bText, fontWeight: FontWeight.bold, height: 1),
                                    ),
                                  ),
                                  SizedBox(width: context.wp(2)),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                                    child: Icon(
                                      homeCtrl.isExpanded.value && homeCtrl.eIndex.value == index
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: AppColor.text,
                                      key: ValueKey(homeCtrl.isExpanded.value),
                                    ),
                                  ),
                                ],
                              ),
                              children: [
                                Container(
                                  color: AppColor.white,
                                  child: Column(
                                    children: [
                                      SizedBox(height: context.sp(1)),
                                      Divider(color: AppColor.divider, height: 0),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: data.matches?.length ?? 0,
                                        padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                                        itemBuilder: (context, matchIndex) {
                                          final matchData = data.matches?[matchIndex];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigation.pushNamed(Routes.matchDetails);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: context.hp(1.5)),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "${matchData?.home?.name}",
                                                            textAlign: TextAlign.end,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: tInter(context, fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                        SizedBox(width: context.wp(2)),
                                                        showFlagImage(
                                                          context: context,
                                                          url:
                                                              "https://images.fotmob.com/image_resources/logo/teamlogo/${matchData?.home?.id}_xsmall.png",
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Container(
                                                    width: context.wp(20),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${matchData?.home?.score ?? 0}  -  ${matchData?.away?.score ?? 0}",
                                                      style: tInter(context, fontWeight: FontWeight.bold, fontSize: 18),
                                                    ),
                                                  ),

                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        showFlagImage(
                                                          context: context,
                                                          url:
                                                              "https://images.fotmob.com/image_resources/logo/teamlogo/${matchData?.away?.id}_xsmall.png",
                                                        ),
                                                        SizedBox(width: context.wp(2)),
                                                        Flexible(
                                                          child: Text(
                                                            "${matchData?.away?.name}",
                                                            textAlign: TextAlign.start,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: tInter(context, fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context, int index) {
                                          return Divider(color: AppColor.divider, height: 0);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: context.hp(1.3));
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
