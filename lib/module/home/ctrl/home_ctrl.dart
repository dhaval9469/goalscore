import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeCtrl extends GetxController {
  DateTime today = DateTime.now();

  var selectedDate = DateTime.now().obs;

  List<DateTime> dates = [];

  @override
  void onInit() {
    super.onInit();
    generateDates();
  }

  void generateDates() {
    DateTime start = DateTime(today.year, today.month - 2, today.day);
    DateTime end = DateTime(today.year, today.month + 2, today.day);

    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;

    String apiDate = DateFormat('yyyyMMdd').format(date);
  }

  String label(DateTime date) {
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime tomorrow = today.add(Duration(days: 1));

    if (isSame(date, today)) return "TODAY";
    if (isSame(date, yesterday)) return "Yesterday";
    if (isSame(date, tomorrow)) return "Tomorrow";

    return DateFormat("E dd MMM").format(date);
  }

  int getTodayIndex() {
    return dates.indexWhere((d) => isSame(d, today));
  }

  bool isSame(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }
}
