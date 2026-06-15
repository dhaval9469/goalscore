import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart';
import 'package:goalscore/module/match_details/page/commentary.dart';
import 'package:goalscore/module/match_details/page/h2h.dart';
import 'package:goalscore/module/match_details/page/incident.dart';
import 'package:goalscore/module/match_details/page/lineup.dart';
import 'package:goalscore/module/match_details/page/overview.dart';
import 'package:goalscore/module/match_details/page/stats.dart';
import 'package:goalscore/module/match_details/widget/n_match_details_widgets.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/navigation.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  final ScrollController _scrollController = ScrollController();
  final mdCtrl = Get.find<MdCtrl>();

  double _percent = 1.0;
  late double _expandedHeight;

  /*  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.delayed(const Duration(seconds: 3), () {
      if (_scrollController.hasClients) {
        final collapsedHeight = kToolbarHeight + kTextTabBarHeight;
        final maxScroll = _expandedHeight - collapsedHeight;
        _scrollController.animateTo(maxScroll, duration: const Duration(milliseconds: 1200), curve: Curves.easeInOutCubic);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _expandedHeight = context.hp(32);
  }*/

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final expandedHeight = context.hp(32);
    //   final collapsedHeight = context.hp(5.5);
    //   final maxScroll = expandedHeight - collapsedHeight;
    //
    //   Future.delayed(const Duration(seconds: 3), () {
    //     if (_scrollController.hasClients) {
    //       _scrollController.animateTo(maxScroll, duration: const Duration(milliseconds: 1200), curve: Curves.easeInOutCubic);
    //     }
    //   });
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _expandedHeight = context.hp(32);
  }

  void _onScroll() {
    if (!mounted) return;

    final collapsedHeight = kToolbarHeight + kTextTabBarHeight;

    final maxScroll = _expandedHeight - collapsedHeight;

    final p = (1.0 - (_scrollController.offset / maxScroll)).clamp(0.0, 1.0);

    if ((_percent - p).abs() > 0.004) {
      setState(() => _percent = p);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: context.hp(5.5),
                automaticallyImplyLeading: false,
                expandedHeight: _expandedHeight,
                backgroundColor: AppColor.header,
                title: Opacity(
                  opacity: _percent,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          mdCtrl.league.value,
                          overflow: TextOverflow.ellipsis,
                          style: tDmSans(context, fontWeight: FontWeight.bold, fontSize: context.sp(17), color: AppColor.bText),
                        ),
                      ),
                      // Text(
                      //   " - Round ${mdCtrl.mdEvent.value?.roundInfo?.round}",
                      //   overflow: TextOverflow.ellipsis,
                      //   style: stDmSans(context, fontSize: context.sp(12), color: AppColor.bsText),
                      // ),
                    ],
                  ),
                ),
                leading: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigation.pop();
                    },
                    child: FaIcon(FontAwesomeIcons.angleLeft, color: AppColor.white),
                  ),
                ),
                flexibleSpace: Obx(
                  () => mdCtrl.isMDLoader.value
                      ? Loader(color: AppColor.white)
                      : _HeaderFlexible(percent: _percent, expandedHeight: _expandedHeight, scrollController: _scrollController),
                ),
                bottom: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelStyle: tabLabelTextStyle(context),
                  unselectedLabelStyle: tabUnLabelTextStyle(context),
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: context.wp(2)),
                  indicatorColor: AppColor.badge,
                  dividerColor: Colors.transparent,
                  indicatorWeight: 1,
                  tabs: [
                    commonTab(context, title: "Overview"),
                    commonTab(context, title: "Incident"),
                    commonTab(context, title: "Lineup"),
                    commonTab(context, title: "Stats"),
                    commonTab(context, title: "Commentry"),
                    commonTab(context, title: "H2H"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [Overview(), IncidentPage(), LineupPage(), StatsPage(), CommentaryPage(), H2hPage()]),
        ),
      ),
    );
  }
}

class _HeaderFlexible extends StatelessWidget {
  final double percent;
  final double expandedHeight;
  final ScrollController scrollController;

  _HeaderFlexible({required this.percent, required this.expandedHeight, required this.scrollController});

  final mdCtrl = Get.find<MdCtrl>();

  double lerp(double a, double b, double t) => a + (b - a) * t;

  double _opacityFromScroll({required double start, required double end}) {
    final offset = scrollController.hasClients ? scrollController.offset : 0.0;
    if (offset <= start) return 1.0;
    if (offset >= end) return 0.0;
    return 1.0 - ((offset - start) / (end - start));
  }

  @override
  Widget build(BuildContext context) {
    final data = mdCtrl.matchHeader.value;
    final hasHomeGoal = data?.events?.homeTeamGoals?.isNotEmpty;
    final hasAwayGoal = data?.events?.awayTeamGoals?.isNotEmpty;
    final hasAnyGoal = (hasHomeGoal ?? false) || (hasAwayGoal ?? false);

    final goalOpacity = _opacityFromScroll(start: 0, end: 70);
    final nameOpacity = _opacityFromScroll(start: 0, end: 100);
    final centerSpacing = lerp(45, 20, percent);

    double logoRadius = lerp(22, 22, percent);
    logoRadius = logoRadius.clamp(22, 22);

    final dashOpacity = _rangePercent(percent, 0.10, 0.20);

    final fullTimeOpacity = 1.0 - dashOpacity;
    final widthPercent = 1.0 - _rangePercent(percent, 0.10, 0.50);
    final centerWidth = lerp(10, 12, widthPercent);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Transform.translate(
                  offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0),
                  child: Transform.scale(
                    scale: lerp(0.72, 1.0, percent),
                    alignment: Alignment.centerRight,
                    child: showTeamLogo(context: context, isFullUrl: true, url: "${data?.teams?.first.imageUrl}"),
                  ),
                ),
              ),

              SizedBox(width: centerSpacing),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data?.teams?.first.score}",
                    style: tInter(
                      context,
                      color: (data?.teams?.first.score ?? 0) > (data?.teams?.last.score ?? 0) ? AppColor.badge : AppColor.bText,
                      fontSize: lerp(28, 35, percent),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: context.wp(centerWidth),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: dashOpacity,
                          child: Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: lerp(24, 32, percent),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Opacity(
                          opacity: fullTimeOpacity,
                          child: Transform.scale(
                            scale: lerp(0.5, 1.0, fullTimeOpacity),
                            child: Text(
                              getMatchStatusText(status: data?.status),
                              textAlign: TextAlign.center,
                              style: tInter(context, color: AppColor.bsText, fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "${data?.teams?.last.score}",
                    style: tInter(
                      context,
                      color: (data?.teams?.last.score ?? 0) > (data?.teams?.first.score ?? 0) ? AppColor.badge : AppColor.bText,
                      fontSize: lerp(28, 35, percent),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(width: centerSpacing),

              Expanded(
                child: Transform.translate(
                  offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0),
                  child: Transform.scale(
                    scale: lerp(0.72, 1.0, percent),
                    alignment: Alignment.centerLeft,
                    child: showTeamLogo(context: context, isFullUrl: true, url: "${data?.teams?.last.imageUrl}"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: lerp(0, 7, percent)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Opacity(
                  opacity: nameOpacity,
                  child: Transform.translate(
                    offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.012),
                    child: Text(
                      "${data?.teams?.first.name}",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: tInter(
                        context,
                        color: AppColor.bText,
                        fontSize: lerp(0, 12, percent),
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: centerSpacing),

              /// CENTER SCORE
              Container(
                width: context.wp(20),
                alignment: Alignment.center,
                child: Opacity(
                  opacity: nameOpacity,
                  child: Transform.translate(
                    offset: Offset(0, lerp(-10, 0, nameOpacity)),
                    child: Text(
                      getMatchStatusText(status: data?.status),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: tInter(
                        context,
                        color: AppColor.bsText,
                        fontSize: lerp(0, 12, percent),
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: centerSpacing),

              /// AWAY
              Expanded(
                child: Opacity(
                  opacity: nameOpacity,
                  child: Transform.translate(
                    offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.012),
                    child: Text(
                      "${data?.teams?.last.name}",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: tInter(
                        context,
                        color: AppColor.bText,
                        fontSize: lerp(0, 12, percent),
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: lerp(28, 12, percent)),
          if (hasAnyGoal)
            Opacity(
              opacity: goalOpacity,
              child: Transform.translate(
                offset: Offset(0, lerp(-10, 0, goalOpacity)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: hasHomeGoal ?? false
                            ? _buildGoalList(context, data?.events?.homeTeamGoals, true)
                            : const SizedBox.shrink(),
                      ),
                      SizedBox(
                        width: context.wp(10),
                        height: context.wp(5),
                        child: Padding(
                          padding: EdgeInsets.only(top: context.wp(1)),
                          child: Image.asset(AppAssets.football, color: AppColor.white, scale: 40),
                        ),
                      ),
                      Expanded(
                        child: hasAwayGoal ?? false
                            ? _buildGoalList(context, data?.events?.awayTeamGoals, false)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(height: lerp(0, 40, percent)),
        ],
      ),
    );
  }

  double _rangePercent(double value, double start, double end) {
    return ((value - start) / (end - start)).clamp(0.0, 1.0);
  }

  Widget _buildGoalList(BuildContext context, Map<String, List<GoalEvent>>? scoreDetail, bool isHomeGoal) {
    final goals =
        scoreDetail?.entries.expand((entry) => entry.value.map((goal) => MapEntry(entry.key, goal))).take(2).toList() ?? [];
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final playerKey = goals[index].key; // van Dijk
        final goal = goals[index].value;

        return isHomeGoal
            ? Row(
                children: [
                  Expanded(
                    child: Text(
                      playerKey,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: stInter(context, fontSize: lerp(0, 11, percent), color: AppColor.bsText),
                    ),
                  ),
                  Text(
                    "  ${goal.time ?? ''}'",
                    style: stInter(context, fontSize: lerp(0, 11, percent), color: AppColor.bsText),
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    "${goal.time ?? ''}'  ",
                    style: stInter(context, fontSize: lerp(0, 11, percent), color: AppColor.bsText),
                  ),
                  Expanded(
                    child: Text(
                      playerKey,
                      overflow: TextOverflow.ellipsis,
                      style: stInter(context, fontSize: lerp(0, 11, percent), color: AppColor.bsText),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
