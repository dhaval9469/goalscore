import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/module/match_details/widget/match_details_widget.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';

class CommentaryPage extends StatelessWidget {
  CommentaryPage({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(top: context.hp(2),bottom: context.hp(8)),
        itemCount: mdCtrl.commentList.length,
        itemBuilder: (context, index) {
          final data = mdCtrl.commentList[index];
          return card(
            context: context,
            child: data.type == "corner"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: Text('${data.time}', style: tDmSans(context, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Row(
                            children: [
                              Image.asset(AppAssets.corner, scale: 45),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                'Corner Kick',
                                style: tDmSans(context, fontSize: context.sp(14), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Text('${data.text}', style: stDmSans(context, fontSize: context.sp(13))),
                          ),
                        ],
                      ),
                    ],
                  )
                : data.type == "goal"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: Text('${data.time}', style: tDmSans(context, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Row(
                            children: [
                              Image.asset(AppAssets.football, scale: 45),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                'Goalllll!',
                                style: tDmSans(context, fontSize: context.sp(14), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Text('${data.text}', style: stDmSans(context, fontSize: context.sp(13))),
                          ),
                        ],
                      ),
                    ],
                  )
                : data.type == "substitution"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: Text('${data.time}', style: tDmSans(context, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Row(
                            children: [
                              playerIn(context, size: context.sp(10)),
                              playerOut(context),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                'Substitution',
                                style: tDmSans(context, fontSize: context.sp(14), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${data.playerIn?.name}',
                                    overflow: TextOverflow.ellipsis,
                                    style: stDmSans(context, fontSize: context.sp(13)),
                                  ),
                                ),
                                SizedBox(width: context.wp(1)),
                                Text(
                                  '(IN)',
                                  style: stDmSans(context, fontSize: context.sp(13), color: AppColor.gArrow),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${data.playerOut?.name}',
                                    overflow: TextOverflow.ellipsis,
                                    style: stDmSans(context, fontSize: context.sp(13)),
                                  ),
                                ),
                                SizedBox(width: context.wp(1)),
                                Text(
                                  '(OUT)',
                                  style: stDmSans(context, fontSize: context.sp(13), color: AppColor.rArrow),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : data.type == "yellow card"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: Text('${data.time}', style: tDmSans(context, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Row(
                            children: [
                              yellowCard(context),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                'Yellow Card',
                                style: tDmSans(context, fontSize: context.sp(14), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Text('${data.text}', style: stDmSans(context, fontSize: context.sp(13))),
                          ),
                        ],
                      ),
                    ],
                  )
                : data.type == "red card"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: Text('${data.time}', style: tDmSans(context, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Row(
                            children: [
                              redCard(context),
                              SizedBox(width: context.wp(1.5)),
                              Text(
                                'Red Card',
                                style: tDmSans(context, fontSize: context.sp(14), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.wp(16),
                            child: Center(
                              child: showPlayerImage(context: context, url: ""),
                            ),
                          ),
                          SizedBox(width: context.wp(1.5)),
                          Flexible(
                            child: Text('${data.text}', style: stDmSans(context, fontSize: context.sp(13))),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: context.wp(16),
                        child: Center(
                          child: Text(
                            data.incidentClass == "ended" && data.time == " " ? "FT" : '${data.time}',
                            style: tDmSans(context, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: context.wp(1.5)),
                      Flexible(
                        child: Text('${data.text}', style: stDmSans(context, fontSize: context.sp(13))),
                      ),
                    ],
                  ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: context.hp(1));
        },
      ),
    );
  }
}
