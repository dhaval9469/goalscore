import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goalscore/module/home/model/matches_model.dart';
import 'package:goalscore/res/textstyle.dart';

class MatchTimerWidget extends StatefulWidget {
  final Time? time;

  const MatchTimerWidget({super.key, required this.time});

  @override
  State<MatchTimerWidget> createState() => _MatchTimerWidgetState();
}

class _MatchTimerWidgetState extends State<MatchTimerWidget> {
  late Timer _timer;
  String _minute = '';

  @override
  void initState() {
    super.initState();
    _minute = getLiveMinute(widget.time);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _minute = getLiveMinute(widget.time);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getLiveMinute(Time? time) {
    if (time == null) return '';
    if (time.status?.type != 'inprogress') return '';
    if (time.currentPeriodStartTimestamp == null) return '';

    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final elapsed = now - time.currentPeriodStartTimestamp!;
    final elapsedMinutes = elapsed ~/ 60;

    int baseMinute = 0;

    switch (time.status?.description) {
      case '1st_half':
        baseMinute = 0;
      case '2nd_half':
        baseMinute = 45;
      case '1st_extra':
        baseMinute = 90;
      case '2nd_extra':
        baseMinute = 105;
      default:
        baseMinute = 0;
    }

    final totalMinute = baseMinute + elapsedMinutes;

    if (totalMinute > 90) {
      return "90+'";
    }

    return "${totalMinute.clamp(1, 90)}'";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _minute,
      style: stInter(context, fontWeight: FontWeight.w700, color: Colors.red),
    );
  }
}
