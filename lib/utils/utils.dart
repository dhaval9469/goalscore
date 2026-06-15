import 'package:flutter/material.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:intl/intl.dart';

Widget commonTab(BuildContext context, {required String title}) {
  return Tab(
    height: context.hp(4.5),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
      child: Text(title),
    ),
  );
}

class Loader extends StatelessWidget {
  final Color? color;

  const Loader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColor.black,
        strokeWidth: 1,
        constraints: BoxConstraints(minHeight: context.wp(8), minWidth: context.wp(8)),
      ),
    );
  }
}

Widget card({required BuildContext context, Color? color, bool isBoxShadow = false, Widget? child, EdgeInsetsGeometry? padding}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
    child: Container(
      decoration: BoxDecoration(
        color: color ?? AppColor.bg,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(color: AppColor.bDivider),
        boxShadow: isBoxShadow ? [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, spreadRadius: 0)] : null,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: context.wp(1.7), vertical: context.hp(1)),
        child: child,
      ),
    ),
  );
}

Widget headerPadding({required BuildContext context, Widget? child}) {
  return Padding(padding: EdgeInsets.fromLTRB(context.wp(3), context.hp(1), context.wp(3), context.hp(0.4)), child: child);
}

String startTime(int? timestamp) {
  if (timestamp == null) return '';
  final dt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final date = '${dt.day} ${months[dt.month - 1]}';
  final time = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  return '$date\n$time';
}

Widget yellowCard(BuildContext context) {
  return Container(
    height: context.hp(2),
    width: context.wp(3),
    decoration: BoxDecoration(color: AppColor.yellowCard, borderRadius: BorderRadius.circular(3)),
  );
}

Widget redCard(BuildContext context) {
  return Container(
    height: context.hp(2),
    width: context.wp(3),
    decoration: BoxDecoration(color: AppColor.redCard, borderRadius: BorderRadius.circular(3)),
  );
}

List<double> getUEFASpacing(int count) {
  switch (count) {
    case 1:
      return [0.5];

    case 2:
      return [0.3, 0.7];

    case 3:
      return [0.2, 0.5, 0.8];

    case 4:
      return [0.15, 0.38, 0.62, 0.85];

    case 5:
      return [0.1, 0.3, 0.5, 0.7, 0.9];

    default:
      return List.generate(count, (i) => (i + 1) / (count + 1));
  }
}

String formatTitle(String? text) {
  if (text == null || text.isEmpty) return "";

  return text
      .split('_') // split by _
      .map((word) => word[0].toUpperCase() + word.substring(1)) // capitalize
      .join(' '); // join with space
}

String formatUtcToLocalMatchTime(String? utcTime) {
  if (utcTime == null || utcTime.isEmpty) return "";

  try {
    final DateTime utcDateTime = DateTime.parse(utcTime);
    final DateTime localDateTime = utcDateTime.toLocal();

    return DateFormat('EEE, MMMM d, h:mm a').format(localDateTime);
  } catch (e) {
    return "";
  }
}
