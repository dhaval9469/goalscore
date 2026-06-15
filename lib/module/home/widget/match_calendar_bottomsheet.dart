import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/res/textstyle.dart';
import 'package:goalscore/utils/navigation.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:intl/intl.dart';

class MatchCalendarBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const MatchCalendarBottomSheet({super.key, required this.selectedDate, required this.onDateSelected});

  @override
  State<MatchCalendarBottomSheet> createState() => _MatchCalendarBottomSheetState();
}

class _MatchCalendarBottomSheetState extends State<MatchCalendarBottomSheet> {
  late DateTime _currentMonth;
  late DateTime _selected;
  final DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(widget.selectedDate.year, widget.selectedDate.month);
    _selected = widget.selectedDate;
  }

  void _prevMonth() => setState(() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
  });

  void _nextMonth() => setState(() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
  });

  bool _isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isToday(DateTime date) => _isSameDay(date, _today);

  List<DateTime?> _buildCalendarDays() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);

    final startPadding = firstDay.weekday % 7;
    final List<DateTime?> days = List.filled(startPadding, null, growable: true);

    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final days = _buildCalendarDays();
    final weekLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final todayWeekIndex = _today.weekday % 7;
    return Container(
      height: context.hp(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: AppColor.card,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: AppColor.divider,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(4), vertical: context.hp(1.5)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _prevMonth,
                    child: FaIcon(FontAwesomeIcons.angleLeft, color: AppColor.sText, size: context.sp(18)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.wp(7)),
                    child: Text(
                      DateFormat('MMMM yyyy').format(_currentMonth),
                      textAlign: TextAlign.center,
                      style: tInter(context, fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: _nextMonth,
                    child: FaIcon(FontAwesomeIcons.angleRight, color: AppColor.sText, size: context.sp(18)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigation.pop();
                    },
                    child: FaIcon(FontAwesomeIcons.xmark, color: AppColor.sText, size: context.sp(18)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.hp(1.3)),
          Row(
            children: weekLabels
                .asMap()
                .entries
                .map(
                  (entry) => Expanded(
                    child: Center(
                      child: Text(
                        entry.value,
                        style: stDmSans(context, color: entry.key == todayWeekIndex ? AppColor.text : AppColor.sText),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: context.hp(0.7)),
          // Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final date = days[index];
              if (date == null) return const SizedBox();

              final isSelected = _isSameDay(date, _selected);
              final isToday = _isToday(date);

              return GestureDetector(
                onTap: () {
                  setState(() => _selected = date);
                  widget.onDateSelected(date);
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: context.wp(10),
                      height: context.wp(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.badge
                            : isToday && !isSelected
                            ? AppColor.divider
                            : Colors.transparent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        '${date.day}',
                        textAlign: TextAlign.center,
                        style: tBarlow(
                          context,
                          color: isSelected
                              ? AppColor.bText
                              : date.month != _currentMonth.month
                              ? AppColor.sText
                              : date.isBefore(DateTime(_today.year, _today.month, _today.day))
                              ? AppColor.sText
                              : AppColor.text,
                          fontSize: isToday || isSelected ? context.sp(18) : context.sp(15),
                          fontWeight: isToday || isSelected ? FontWeight.w800 : FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
