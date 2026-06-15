import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalscore/module/match_details/model/m_bast_player_m.dart';
import 'package:goalscore/module/match_details/model/m_lineup_m.dart';
import 'package:goalscore/module/match_details/model/m_relevant_matches_m.dart';
import 'package:goalscore/module/match_details/widget/player_widget.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/utils/time_utils.dart';
import 'package:goalscore/utils/utils.dart';
import 'package:goalscore/widget/image_loader.dart';



Widget sPossessionWidget({
  required BuildContext context,
  String? home,
  String? title,
  String? away,
  required int hFlex,
  required int aFlex,
  Color? hColor,
  Color? aColor,
}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: context.hp(1.3), bottom: context.hp(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$home",
              style: stBarlow(context, fontWeight: FontWeight.w600, color: AppColor.text),
            ),
            Text(
              formatTitle(title),
              style: stDmSans(context, fontWeight: FontWeight.w600, color: AppColor.text),
            ),
            Text(
              "$away",
              style: stBarlow(context, fontWeight: FontWeight.w600, color: AppColor.text),
            ),
          ],
        ),
      ),

      LayoutBuilder(
        builder: (context, constraints) {
          final total = (hFlex + aFlex) == 0 ? 1 : (hFlex + aFlex);

          final hWidth = (hFlex / total) * constraints.maxWidth;
          final aWidth = (aFlex / total) * constraints.maxWidth;

          return Row(
            children: [
              /// HOME BAR
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                width: hWidth,
                height: context.hp(0.7),
                decoration: BoxDecoration(
                  color: hColor,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                ),
              ),

              /// AWAY BAR
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                width: aWidth,
                height: context.hp(0.7),
                decoration: BoxDecoration(
                  color: aColor,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}


Widget rMSWidget(RMData data, BuildContext context) {
  final type = data.status?.type ?? '';
  final description = data.status?.description ?? '';

  switch (type) {
    case 'inprogress':
      if (description == 'halftime') {
        return Text(
          'HT',
          style: stInter(context, fontWeight: FontWeight.w600, color: Colors.orange),
        );
      }
      return Text(
        getRMLiveMinute(data.time),
        style: tInter(context, fontWeight: FontWeight.w700, color: Colors.red),
      );
    case 'finished':
      return Text('FT', style: stInter(context, fontWeight: FontWeight.w600));

    case 'not_started':
      return Text(startTime(data.startTimestamp), style: stInter(context, fontWeight: FontWeight.w600));

    default:
      return const SizedBox.shrink();
  }
}

Widget playerIn(BuildContext context, {double? size}) {
  return FaIcon(FontAwesomeIcons.upLong, size: size ?? context.sp(12), color: AppColor.gArrow);
}

Widget playerOut(BuildContext context, {double? size}) {
  return FaIcon(FontAwesomeIcons.downLong, size: size ?? context.sp(10), color: AppColor.rArrow);
}

Widget buildPlayer(BuildContext context, Map<String, dynamic> data) {
  final player = data["player"] as Players;

  final fieldWidth = context.wp(93);
  final fieldHeight = context.hp(70);

  return Positioned(
    top: fieldHeight * data["top"],
    left: fieldWidth * data["left"],
    child: FractionalTranslation(
      translation: Offset(-0.5, -0.5),
      child: PlayerWidget(player: player),
    ),
  );
}

Widget benchPlayer(BuildContext context, {Players? data, bool isLeft = false}) {
  return isLeft == true
      ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("${data?.player?.name}", style: tInter(context, height: 0)),
            showPlayerImage(context: context, url: ""),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showPlayerImage(context: context, url: ""),
            Text("${data?.player?.name}", style: tInter(context, height: 0)),
          ],
        );
}

Widget injuriesPlayer(BuildContext context, {MissingPlayers? data, bool isLeft = false}) {
  return isLeft == true
      ? Padding(
          padding: EdgeInsets.only(left: context.wp(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${data?.player?.name}", overflow: TextOverflow.ellipsis, style: tInter(context, height: 1)),
                    Text(
                      "${data?.type}",
                      overflow: TextOverflow.ellipsis,
                      style: stDmSans(context, height: 0, fontSize: context.sp(12)),
                    ),
                  ],
                ),
              ),
              showPlayerImage(context: context, url: ""),
            ],
          ),
        )
      : Padding(
          padding: EdgeInsets.only(right: context.wp(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              showPlayerImage(context: context, url: ""),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data?.player?.name}", overflow: TextOverflow.ellipsis, style: tInter(context, height: 1)),
                    Text(
                      "${data?.type}",
                      overflow: TextOverflow.ellipsis,
                      style: stDmSans(context, height: 0, fontSize: context.sp(12)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}

Widget statsItem(BuildContext context, {String? text, bool isSelected = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.wp(28),
      decoration: BoxDecoration(color: isSelected ? AppColor.badge : AppColor.divider, borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(vertical: context.hp(0.5)),
      child: Center(
        child: Text(
          "$text",
          style: tDmSans(context, fontWeight: FontWeight.bold, color: isSelected ? AppColor.bText : AppColor.text),
        ),
      ),
    ),
  );
}

//  new --------------------------------------------------------

