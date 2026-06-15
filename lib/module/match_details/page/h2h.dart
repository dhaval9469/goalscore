import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/match_details/ctrl/md_ctrl.dart';
import 'package:goalscore/res/app_color.dart';

class H2hPage extends StatelessWidget {
  H2hPage({super.key});

  final mdCtrl = Get.find<MdCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(children: [

        ]),
      ),
    );
  }
}
