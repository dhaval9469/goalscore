import 'package:flutter/material.dart';
import 'package:goalscore/module/match_details/model/m_lineup_m.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:goalscore/widget/image_loader.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key, required this.player});

  final Players player;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        showPlayerImage(context: context, url: ""),
        SizedBox(
          width: context.wp(16),
          child: Text(
            player.player?.name ?? "",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: tDmSans(context, color: AppColor.bText, fontSize: context.sp(12), height: 1),
          ),
        ),
      ],
    );
  }
}
