import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/page/commentary.dart';
import 'package:goalscore/module/match_details/page/h2h.dart';
import 'package:goalscore/module/match_details/page/lineup.dart';
import 'package:goalscore/module/match_details/page/player_ranking.dart';
import 'package:goalscore/module/match_details/page/stats.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';

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

  @override
  void initState() {
    super.initState();
    _expandedHeight = context.hp(28);
    _scrollController.addListener(_onScroll);
    Future.delayed(const Duration(seconds: 3), () {
      if (_scrollController.hasClients) {
        final collapsedHeight = kToolbarHeight + kTextTabBarHeight;
        final maxScroll = _expandedHeight - collapsedHeight;
        _scrollController.animateTo(maxScroll, duration: const Duration(milliseconds: 1200), curve: Curves.easeInOutCubic);
      }
    });
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
      length: 5,
      child: Scaffold(
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                expandedHeight: _expandedHeight,
                backgroundColor: AppColor.header,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                flexibleSpace: _HeaderFlexible(
                  percent: _percent,
                  expandedHeight: _expandedHeight,
                  mdCtrl: mdCtrl,
                  scrollController: _scrollController,
                ),
                bottom: const TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: "Highlights"),
                    Tab(text: "Lineup"),
                    Tab(text: "Stats"),
                    Tab(text: "Player Ranking"),
                    Tab(text: "H2H"),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(children: [Commentary(), Lineup(), Stats(), PlayerRanking(), H2h()]),
        ),
      ),
    );
  }
}

class _HeaderFlexible extends StatelessWidget {
  final double percent;
  final double expandedHeight;
  final MdCtrl mdCtrl;
  final ScrollController scrollController;

  const _HeaderFlexible({
    required this.percent,
    required this.expandedHeight,
    required this.mdCtrl,
    required this.scrollController,
  });

  double lerp(double a, double b, double t) => a + (b - a) * t;

  double _opacityFromScroll({required double start, required double end}) {
    final offset = scrollController.hasClients ? scrollController.offset : 0.0;
    if (offset <= start) return 1.0;
    if (offset >= end) return 0.0;
    return 1.0 - ((offset - start) / (end - start));
  }

  @override
  Widget build(BuildContext context) {
    final hasHomeGoal = mdCtrl.homeTeamGoals.isNotEmpty;
    final hasAwayGoal = mdCtrl.awayTeamGoals.isNotEmpty;
    final hasAnyGoal = hasHomeGoal || hasAwayGoal;
    final goalOpacity = _opacityFromScroll(start: 0, end: 70);
    final nameOpacity = _opacityFromScroll(start: 0, end: 100);
    final centerSpacing = lerp(45, 30, percent);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(right: context.wp(3), left: context.wp(3)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * -0.025),
                        child: Transform.scale(
                          scale: lerp(0.72, 1.0, percent),
                          alignment: Alignment.topRight,
                          child: _teamLogo(context),
                        ),
                      ),
                      SizedBox(height: lerp(0, 15, percent)),
                      Opacity(
                        opacity: nameOpacity,
                        child: Transform.translate(
                          offset: Offset(0, lerp(-10, 0, nameOpacity)),
                          child: Text(
                            "Rajasthan United FC",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: lerp(0, 14, percent),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: centerSpacing),

                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "1",
                          style: tInter(
                            context,
                            color: AppColor.bText,
                            fontSize: lerp(28, 35, percent),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.wp(1.5)),
                          child: Text(
                            "-",
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: lerp(28, 32, percent),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "1",
                          style: tInter(
                            context,
                            color: AppColor.bText,
                            fontSize: lerp(28, 35, percent),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: nameOpacity,
                      child: Transform.translate(
                        offset: Offset(0, lerp(-10, 0, nameOpacity)),
                        child: Text(
                          "Full Time",
                          style: tInter(
                            context,
                            color: AppColor.bText,
                            fontSize: lerp(0, 14, percent),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: centerSpacing),

                Expanded(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * -0.025),
                        child: Transform.scale(
                          scale: lerp(0.72, 1.0, percent),
                          alignment: Alignment.topLeft,
                          child: _teamLogo(context),
                        ),
                      ),
                      SizedBox(height: lerp(0, 15, percent)),
                      Opacity(
                        opacity: nameOpacity,
                        child: Transform.translate(
                          offset: Offset(0, lerp(-10, 0, nameOpacity)),
                          child: Text(
                            "Real Kashmir FC",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: lerp(0, 14, percent),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: lerp(45, 7, percent)),
            if (hasAnyGoal)
            Opacity(
              opacity: goalOpacity,
              child: Transform.translate(
                offset: Offset(0, lerp(-10, 0, goalOpacity)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: hasHomeGoal
                          ? _buildGoalList(context, mdCtrl.homeTeamGoals, TextAlign.right)
                          : const SizedBox.shrink(),
                    ),
                    if (hasHomeGoal && hasAwayGoal) SizedBox(width: context.wp(10)),
                    Expanded(
                      child: hasAwayGoal
                          ? _buildGoalList(context, mdCtrl.awayTeamGoals, TextAlign.left)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: lerp(0, 50, percent)),
          ],
        ),
      ),
    );
  }

  Widget _teamLogo(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: AppColor.bg,
      child: Icon(Icons.shield, color: Colors.white, size: 20),
    );
  }

  Widget _buildGoalList(BuildContext context, List goals, TextAlign align) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: goals.length > 2 ? 2 : goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Text(
          "${goal['lastName']} (${goal['timeStr']}')",
          textAlign: align,
          style: stInter(context, fontSize: lerp(0, 13, percent), color: AppColor.bsText),
        );
      },
    );
  }
}
