import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/ctrl/home_ctrl.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeCtrl.dates.length,
      initialIndex: homeCtrl.getTodayIndex(),
      child: Scaffold(
        backgroundColor: AppColor.bg,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColor.header,
                title: Text(
                  "Matches",
                  style: tInter(
                    context,
                    fontWeight: FontWeight.bold,
                    color: AppColor.bText,
                    fontSize: context.sp(20),
                  ),
                ),
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  isScrollable: true,
                  labelStyle: tMontserrat(
                    context,
                    color: AppColor.bText,
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: tMontserrat(
                    context,
                    color: AppColor.bsText,
                    fontSize: context.sp(13),
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColor.white,
                  labelPadding: EdgeInsets.zero,
                  tabs: homeCtrl.dates.map((date) {
                    return Tab(text: "  ${homeCtrl.label(date)}  ");
                  }).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: homeCtrl.dates.map((date) {
              return Obx(
                () => homeCtrl.isMatchesLoader.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeCtrl.leaguesList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final data = homeCtrl.leaguesList[index];
                          return ExpansionTile(
                            shape: const Border(),
                            collapsedShape: const Border(),
                            title: Text("${data.name}"),
                            children: [

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.matches?.length ?? 0,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                itemBuilder: (context, matchIndex) {
                                  final matchData = data.matches?[matchIndex];
                                  return Padding(
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
                                              CircleAvatar(radius: 12, backgroundColor: Colors.grey[200]),
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
                                              CircleAvatar(radius: 12, backgroundColor: Colors.grey[200]),
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
                                  );
                                },
                              ),
                            ],
                          );
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
