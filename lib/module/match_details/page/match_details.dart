import 'dart:math' as math;
import 'dart:ui';

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
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!mounted) return;
    final max = _expandedHeight - context.hp(6);
    final p   = (1.0 - _scrollController.offset / max).clamp(0.0, 1.0);
    if ((p - _percent).abs() > 0.004) setState(() => _percent = p);
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
    final int maxGoals = math.max(
      mdCtrl.homeTeamGoals.length,
      mdCtrl.awayTeamGoals.length,
    );

    _expandedHeight = context.hp(24) + (maxGoals * context.sp(18).toDouble());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColor.header),
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: context.hp(6),
                collapsedHeight: context.hp(6),
                expandedHeight: _expandedHeight,
                backgroundColor: AppColor.header,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                flexibleSpace: _HeaderFlexible(
                  percent: _percent,
                  expandedHeight: _expandedHeight,
                  mdCtrl: mdCtrl,
                ),
                bottom: const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
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
          body: const TabBarView(
            children: [
              Commentary(),
              Lineup(),
              Stats(),
              PlayerRanking(),
              H2h(),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _HeaderFlexible  — receives percent directly, no LayoutBuilder needed
// ---------------------------------------------------------------------------

class _HeaderFlexible extends StatelessWidget {
  final double percent;        // 1 = expanded · 0 = collapsed
  final double expandedHeight;
  final MdCtrl mdCtrl;

  const _HeaderFlexible({
    required this.percent,
    required this.expandedHeight,
    required this.mdCtrl,
  });

  @override
  Widget build(BuildContext context) {
    final double dashScale = lerpDouble(0.6, 1.0, percent)!;
    final double ftScale   = lerpDouble(1.0, 0.6, percent)!;
    final double dashOpacity = percent;
    final double ftOpacity   = 1.0 - percent;

    final double nameOpacity = percent;
    final double goalOpacity = (percent / 0.6).clamp(0.0, 1.0);
    final double ftLabelOpacity = percent;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.hp(0.3),
          right: context.wp(4),
          left: context.wp(4),
          bottom: context.hp(6),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // ── Teams + Score row ─────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // HOME
                  SizedBox(
                    width: context.wp(30.5),
                    child: Column(
                      children: [
                        // Logo — scale 0.75→1.0, slide in from right
                        Transform.scale(
                          scale: lerpDouble(0.75, 1.0, percent)!,
                          child: Transform.translate(
                            offset: Offset(
                              lerpDouble(context.wp(15), 0, percent)!,
                              0,
                            ),
                            child: _teamLogo(context),
                          ),
                        ),
                        SizedBox(height: context.hp(0.6)),
                        // Name
                        Opacity(
                          opacity: nameOpacity,
                          child: Text(
                            "Rajasthan United Fc",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: context.sp(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SCORE + separator
                  SizedBox(
                    width: context.wp(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${1}",
                              style: tInter(
                                context,
                                color: AppColor.bText,
                                fontWeight: FontWeight.bold,
                                fontSize: context.sp(25),
                              ),
                            ),

                            // ── Animated separator ───────────────────────────
                            SizedBox(
                              width: context.wp(8),
                              height: context.sp(34),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // " - "  zoom out + fade on collapse
                                  Opacity(
                                    opacity: dashOpacity,
                                    child: Transform.scale(
                                      scale: dashScale,
                                      child: Text(
                                        " - ",
                                        style: tInter(
                                          context,
                                          color: AppColor.bText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: context.sp(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // "FT"  zoom in + fade on collapse
                                  Opacity(
                                    opacity: ftOpacity,
                                    child: Transform.scale(
                                      scale: ftScale,
                                      child: Text(
                                        "FT", // "FT" / "HT" / "75'"
                                        style: tInter(
                                          context,
                                          color: AppColor.bText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: context.sp(13),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "1",
                              style: tInter(
                                context,
                                color: AppColor.bText,
                                fontWeight: FontWeight.bold,
                                fontSize: context.sp(25),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: context.hp(0.6)),

                        // "Full Time" label
                        Opacity(
                          opacity: ftLabelOpacity,
                          child: Text(
                            'Full Time', // "Full Time" / "Half Time" / live min
                            textAlign: TextAlign.center,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: context.sp(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // AWAY
                  SizedBox(
                    width: context.wp(30.5),
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: lerpDouble(0.75, 1.0, percent)!,
                          child: Transform.translate(
                            offset: Offset(
                              lerpDouble(-context.wp(15), 0, percent)!,
                              0,
                            ),
                            child: _teamLogo(context),
                          ),
                        ),
                        SizedBox(height: context.hp(0.6)),
                        Opacity(
                          opacity: nameOpacity,
                          child: Text(
                            "Real kashmir FC",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: context.sp(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.hp(1)),

              // ── Goal lists — fade out early ───────────────────────────────
              Opacity(
                opacity: goalOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildGoalList(
                        context,
                        mdCtrl.homeTeamGoals,
                        TextAlign.right,
                      ),
                    ),
                    SizedBox(width: context.wp(10)),
                    Expanded(
                      child: _buildGoalList(
                        context,
                        mdCtrl.awayTeamGoals,
                        TextAlign.left,
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
  }

  Widget _teamLogo(BuildContext context) {
    return CircleAvatar(
      radius: context.hp(2.8),
      backgroundColor: AppColor.bg,
    );
  }

  Widget _buildGoalList(
      BuildContext context,
      List goals,
      TextAlign align,
      ) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Text(
          "${goal['lastName']} ${goal['timeStr']}'",
          textAlign: align,
          style: stInter(
            context,
            fontSize: context.sp(12),
            color: AppColor.bsText,
          ),
        );
      },
    );
  }
}

/*class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  final ScrollController _scrollController = ScrollController();
  final mdCtrl = Get.find<MdCtrl>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      if (_scrollController.hasClients) {
        final double expandedHeight = MediaQuery.of(context).size.height * .24;
        final double targetOffset = expandedHeight - kToolbarHeight;

        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int maxGoals = math.max(mdCtrl.homeTeamGoals.length, mdCtrl.awayTeamGoals.length);

    double baseHeaderHeight = context.hp(24);
    double rowHeight = context.sp(18);
    final expandedHeight = baseHeaderHeight + (maxGoals * rowHeight);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColor.header),
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: context.hp(6),
                collapsedHeight: context.hp(6),
                expandedHeight: expandedHeight,
                backgroundColor: AppColor.header,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {

                    double percent = (constraints.maxHeight - kToolbarHeight) / (expandedHeight - kToolbarHeight);
                    percent = percent.clamp(0.0, 1.0);
                    double logoScale = lerpDouble(0.75, 1.0, percent)!;

                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: context.hp(0.3),
                          right: context.wp(4),
                          left: context.wp(4),
                          bottom: context.hp(6),
                        ),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: context.wp(30.5),
                                    child: Column(
                                      children: [

                                        Transform.scale(
                                          scale: logoScale,
                                          child: Transform.translate(
                                            offset: Offset(lerpDouble(context.wp(15), 0, percent)!, 0),
                                            child: _teamLogo(),
                                          ),
                                        ),

                                        SizedBox(height: context.hp(0.6)),

                                        Opacity(
                                          opacity: percent,
                                          child: Text(
                                            'Rajasthan United FC',
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: tInter(
                                              context,
                                              color: AppColor.bText,
                                              fontSize: context.sp(14),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.wp(20),
                                    child: Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "1",
                                              textAlign: TextAlign.center,
                                              style: tInter(
                                                context,
                                                color: AppColor.bText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context.sp(25),
                                              ),
                                            ),
                                            Text(
                                              " - ",
                                              textAlign: TextAlign.center,
                                              style: tInter(
                                                context,
                                                color: AppColor.bText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context.sp(25),
                                              ),
                                            ),
                                            Text(
                                              "1",
                                              textAlign: TextAlign.center,
                                              style: tInter(
                                                context,
                                                color: AppColor.bText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context.sp(25),
                                              ),
                                            ),

                                          ],
                                        ),

                                        SizedBox(height: context.hp(0.6)),

                                        Center(
                                          child: Opacity(
                                            opacity: percent,
                                            child: Text(
                                              "Full Time",
                                              textAlign: TextAlign.center,
                                              style: tInter(
                                                context,
                                                color: AppColor.bText,
                                                fontSize: context.sp(13),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.wp(30.5),
                                    child: Column(
                                      children: [
                                        Transform.scale(
                                          scale: logoScale,
                                          child: Transform.translate(
                                            offset: Offset(lerpDouble(-context.wp(15), 0, percent)!, 0),
                                            child: _teamLogo(),
                                          ),
                                        ),

                                        SizedBox(height: context.hp(0.6)),

                                        Opacity(
                                          opacity: percent,
                                          // opacity: (percent - 0.7).clamp(0.0, 0.3) / 0.3,
                                          child: Text(
                                            'Real Kashmir FC',
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: tInter(
                                              context,
                                              color: AppColor.bText,
                                              fontSize: context.sp(14),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.hp(1)),
                              Opacity(
                                opacity: percent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: _buildGoalList(
                                        mdCtrl.homeTeamGoals,
                                        TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(width: context.wp(10)),
                                    Expanded(
                                      child: _buildGoalList(
                                        mdCtrl.awayTeamGoals,
                                        TextAlign.left,
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
                  },
                ),

                bottom: const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
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

          body: const TabBarView(
            children: [Commentary(), Lineup(), Stats(), PlayerRanking(), H2h()],
          ),
        ),
      ),
    );
  }

  Widget _teamLogo() {
    return CircleAvatar(radius: context.hp(2.8), backgroundColor: AppColor.bg);
  }

  Widget _buildGoalList(List goals, TextAlign align) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Text(
          "${goal['lastName']} ${goal['timeStr']}'",
          textAlign: align,
          style: stInter(context, fontSize: context.sp(12), color: AppColor.bsText),
        );
      },
    );
  }
}*/
