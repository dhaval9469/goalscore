import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {},
            activeColor: const Color(0xFFFF5722),
            headerProps: const EasyHeaderProps(showHeader: false),
            dayProps: const EasyDayProps(dayStructure: DayStructure.dayStrDayNum, height: 80.0, width: 60.0),
          ),
        ),
      ),
    );

  }
}
