import 'package:flutter/material.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';

class OOtherInfo extends StatelessWidget {
  final InfoBox? data;
  final Weather? weatherData;

  const OOtherInfo({super.key, this.data, this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.hp(1.5)),
        card(
          context: context,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.hp(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*
                    Padding(
                  padding: EdgeInsets.only(right: context.wp(2), left: context.wp(0.7)),
                  child: Row(
                    children: [
                      playerImage(context: context, url: "", w: context.wp(3), h: context.wp(3)),
                      SizedBox(width: context.wp(3)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data?.referee?.name}", style: tInter(context, fontSize: context.sp(14))),
                          Text("${data?.referee?.country?.name}", style: tDmSans(context, fontSize: context.sp(12))),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              yellowCard(context),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                "${data?.referee?.stats?.totalYellowCard}",
                                style: stBarlow(context, fontSize: context.sp(14)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              redCard(context),
                              SizedBox(width: context.wp(1.5)),
                              Text("${data?.referee?.stats?.totalRedCard}", style: stBarlow(context, fontSize: context.sp(14))),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: context.hp(1), color: AppColor.bDivider),*/

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.stadium, scale: 20),
                          SizedBox(width: context.wp(4)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data?.stadium?.name}",
                                style: tInter(context, fontSize: context.sp(13), fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${data?.stadium?.city}, ${data?.stadium?.country}",
                                style: stBarlow(context, fontSize: context.sp(12), height: 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.stadiumSeats, scale: 25),
                          SizedBox(width: context.wp(1.5)),
                          Text("${data?.stadium?.capacity}", style: tBarlow(context, fontSize: context.sp(13))),
                        ],
                      ),
                    ],
                  ),
                ),

                Divider(height: context.hp(2.5), color: AppColor.bDivider),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Surface", style: tInter(context, fontSize: context.sp(13))),
                          Spacer(),
                          Text("${data?.stadium?.surface}", style: tDmSans(context, fontSize: context.sp(13))),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Weather conditions", style: tInter(context, fontSize: context.sp(13))),
                          Spacer(),
                          Text("${weatherData?.temperature}°C", style: tDmSans(context, fontSize: context.sp(13))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.wp(1.8)),
                            child: Container(height: context.sp(13), width: context.wp(0.2), color: AppColor.sText),
                          ),
                          Text("${weatherData?.defaultTitle}", style: tDmSans(context, fontSize: context.sp(13))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
