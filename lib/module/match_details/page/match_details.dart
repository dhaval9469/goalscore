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
    _expandedHeight = context.hp(33);
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
                toolbarHeight: context.hp(5.5),
                automaticallyImplyLeading: false,
                expandedHeight: _expandedHeight,
                backgroundColor: AppColor.header,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
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
    final centerSpacing = lerp(45, 20, percent);

    double logoRadius = lerp(22, 22, percent);
    logoRadius = logoRadius.clamp(22, 22);

    final dashOpacity = _rangePercent(percent, 0.10, 0.20);

    final fullTimeOpacity = 1.0 - dashOpacity;
    final widthPercent = 1.0 - _rangePercent(percent, 0.10, 0.50);
    final centerWidth = lerp(10, 12, widthPercent);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(right: context.wp(2), left: context.wp(2)),
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
                      child: CircleAvatar(radius: logoRadius, backgroundColor: AppColor.bg),
                    ),
                  ),
                ),

                SizedBox(width: centerSpacing),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1",
                      style: tInter(context, color: AppColor.bText, fontSize: lerp(28, 35, percent), fontWeight: FontWeight.bold),
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
                                "FT",
                                textAlign: TextAlign.center,
                                style: tInter(context, color: AppColor.bText, fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /*                SizedBox(
                      width: context.wp(10),
                      child: Opacity(
                        opacity: swapOpacity,
                        child: Transform.scale(
                          scale: lerp(0.5, 1.0, swapOpacity),
                          child: Text(
                            "Full Time",
                            textAlign: TextAlign.center,
                            style: tInter(
                              context,
                              color: AppColor.bText,
                              fontSize: lerp(10, 10, swapOpacity),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                    Text(
                      "1",
                      style: tInter(context, color: AppColor.bText, fontSize: lerp(28, 35, percent), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(width: centerSpacing),

                Expanded(
                  child: Transform.translate(
                    offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0),
                    child: Transform.scale(
                      scale: lerp(0.72, 1.0, percent),
                      alignment: Alignment.centerLeft, // 👈 changed from topLeft
                      child: CircleAvatar(radius: logoRadius, backgroundColor: AppColor.bg),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: lerp(0, 3, percent)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Opacity(
                    opacity: nameOpacity,
                    child: Transform.translate(
                      offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.012),
                      child: Text(
                        "Rajasthan United FC",
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
                        "Full Time",
                        textAlign: TextAlign.center,
                        maxLines: 2,
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

                /// AWAY
                Expanded(
                  child: Opacity(
                    opacity: nameOpacity,
                    child: Transform.translate(
                      offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.012),
                      child: Text(
                        "Real Kashmir FC",
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

            /*      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// HOME
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        // Home logo (top-right)
                        Transform.translate(
                          offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0),
                          child: Transform.scale(
                            scale: lerp(0.72, 1.0, percent),
                            alignment: Alignment.topRight,
                            child: CircleAvatar(radius: logoRadius, backgroundColor: AppColor.bg),
                          ),
                        ),

                        SizedBox(height: lerp(0, 5, percent)),

                        Opacity(
                          opacity: nameOpacity,
                          child: Transform.translate(
                            offset: Offset(MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.012),
                            child: Text(
                              "Rajasthan United FC",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: tInter(
                                context,
                                color: AppColor.bText,
                                fontSize: lerp(0, 12, percent),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: centerSpacing),

                /// CENTER SCORE
                Container(
                  color: Colors.red,
                  child: Column(
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
                          SizedBox(
                            width: context.wp(10),
                            height: 30,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                /// DASH → fade out + zoom out
                                Opacity(
                                  opacity: 1 - swapOpacity,
                                  child: Transform.scale(
                                    scale: lerp(1.0, 0.4, swapOpacity),
                                    child: Text(
                                      "-",
                                      style: tInter(
                                        context,
                                        color: AppColor.bText,
                                        fontSize: lerp(24, 32, percent),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                /// FULL TIME → fade in + zoom in
                                Opacity(
                                  opacity: swapOpacity,
                                  child: Transform.scale(
                                    scale: lerp(0.5, 1.0, swapOpacity),
                                    child: Text(
                                      "Full Time",
                                      textAlign: TextAlign.center,
                                      style: tInter(
                                        context,
                                        color: AppColor.bText,
                                        fontSize: lerp(10, 12, swapOpacity),
                                        fontWeight: FontWeight.w600,
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
                              fontSize: lerp(0, 12, percent),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: centerSpacing),

                /// AWAY
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        // Away logo (top-left)
                        Transform.translate(
                          offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0),
                          child: Transform.scale(
                            scale: lerp(0.72, 1.0, percent),
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(radius: logoRadius, backgroundColor: AppColor.bg),
                          ),
                        ),

                        SizedBox(height: lerp(0, 5, percent)),

                        Opacity(
                          opacity: nameOpacity,
                          child: Transform.translate(
                            offset: Offset(-MediaQuery.of(context).size.width * 0.12 * (1 - percent), -expandedHeight * 0.01),
                            child: Text(
                              "Real Kashmir FC",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: tInter(
                                context,
                                color: AppColor.bText,
                                fontSize: lerp(0, 12, percent),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),*/
            SizedBox(height: lerp(45, 5, percent)),

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

  double _rangePercent(double value, double start, double end) {
    return ((value - start) / (end - start)).clamp(0.0, 1.0);
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
          style: stInter(context, fontSize: lerp(0, 11, percent), color: AppColor.bsText),
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
