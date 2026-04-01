import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/model/matches_model.dart';
import 'package:goalscore/module/home/service/home_ser.dart';
import 'package:intl/intl.dart';

class HomeCtrl extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  DateTime today = DateTime.now();


  List<DateTime> dates = [];
  String lastLoadedDate = "";

  void generateDates() {
    DateTime start = DateTime(today.year, today.month - 2, today.day);
    DateTime end = DateTime(today.year, today.month + 2, today.day);

    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    String formattedDate = DateFormat('yyyyMMdd').format(today);
    getMatches(date: formattedDate);
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

  void _handleTabSelection() {
    if (!tabController.indexIsChanging) {
      String formattedDate = DateFormat('yyyyMMdd').format(dates[tabController.index]);
      if (lastLoadedDate != formattedDate) {
        getMatches(date: formattedDate);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    generateDates();
    tabController = TabController(length: dates.length, vsync: this, initialIndex: getTodayIndex());
    tabController.addListener(_handleTabSelection);
  }

  RxBool isMatchesLoader = false.obs;
  RxBool isExpanded = false.obs;

  RxInt eIndex = 0.obs;

  RxList<Leagues> leaguesList = <Leagues>[].obs;

  Future<void> getMatches({String? date}) async {
    try {
      isMatchesLoader.value = true;
      leaguesList.clear();
      final data = await HomeService().matches(date: date);
      leaguesList.addAll(data.leagues ?? []);
      isMatchesLoader.value = false;
    } catch (e) {
      isMatchesLoader.value = false;
      rethrow;
    }
  }
}
