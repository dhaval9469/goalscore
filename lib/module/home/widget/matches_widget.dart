import 'package:flutter/material.dart';
import 'package:goalscore/module/home/model/new_matches_model.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/responsive.dart';

Widget matchStatusWidget(Status? status, BuildContext context) {
  final bool started = status?.started ?? false;
  final bool finished = status?.finished ?? false;
  final bool cancelled = status?.cancelled ?? false;
  final String reasonShort = status?.reason?.short ?? '';

  if (cancelled) {
    return Text(
      reasonShort.isNotEmpty ? reasonShort : 'Cancelled',
      style: stInter(context, fontWeight: FontWeight.w600, color: Colors.grey),
    );
  }

  if (finished) {
    return Text(reasonShort.isNotEmpty ? reasonShort : 'FT', style: stInter(context, fontWeight: FontWeight.w600));
  }

  if (started) {
    final liveMinute = getLiveMinuteFromStatus(status);

    return Text(
      liveMinute,
      style: tInter(context, fontWeight: FontWeight.w700, color: Colors.red),
    );
  }

  return Text(
    _formatKickoffTimeFromUtc(status?.utcTime),
    style: stInter(context, fontWeight: FontWeight.w600, fontSize: context.sp(13)),
  );
}

String _formatKickoffTimeFromUtc(String? utcTime) {
  if (utcTime == null || utcTime.isEmpty) return '';

  final dateTime = DateTime.parse(utcTime).toLocal();

  int hour = dateTime.hour;
  final minute = dateTime.minute.toString().padLeft(2, '0');

  final period = hour >= 12 ? 'PM' : 'AM';

  hour = hour % 12;
  if (hour == 0) hour = 12;

  return '$hour:$minute $period';
}

String getLiveMinuteFromStatus(Status? status) {
  if (status == null) return '';

  final periodLength = status.periodLength ?? 45;
  final halfs = status.halfs;

  final now = DateTime.now();

  final firstHalfStarted = _parseMatchDateTime(halfs?.firstHalfStarted);
  final secondHalfStarted = _parseMatchDateTime(halfs?.secondHalfStarted);

  if (firstHalfStarted == null) return '';

  if (secondHalfStarted == null) {
    final elapsed = now.difference(firstHalfStarted).inMinutes + 1;

    if (elapsed > periodLength) {
      return 'HT';
    }

    return "$elapsed'";
  }

  final secondHalfElapsed = now.difference(secondHalfStarted).inMinutes + 1;
  final matchMinute = periodLength + secondHalfElapsed;

  if (matchMinute > periodLength * 2) {
    return "${periodLength * 2}+";
  }

  return "$matchMinute'";
}

DateTime? _parseMatchDateTime(String? value) {
  if (value == null || value.isEmpty) return null;

  try {
    // Format: 13.06.2026 21:04:51
    final parts = value.split(' ');
    final dateParts = parts[0].split('.');
    final timeParts = parts[1].split(':');

    return DateTime(
      int.parse(dateParts[2]), // year
      int.parse(dateParts[1]), // month
      int.parse(dateParts[0]), // day
      int.parse(timeParts[0]), // hour
      int.parse(timeParts[1]), // minute
      int.parse(timeParts[2]), // second
    );
  } catch (_) {
    return null;
  }
}
