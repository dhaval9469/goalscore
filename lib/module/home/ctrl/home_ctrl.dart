import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:goalscore/module/home/model/allleagues_model.dart';
import 'package:goalscore/module/home/model/new_matches_model.dart';
import 'package:goalscore/module/home/service/home_ser.dart';
import 'package:intl/intl.dart';

class HomeCtrl extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();

  List<DateTime> dates = [];
  String lastLoadedDate = "";
  String timezone = "";

  RxBool isMatchesLoader = false.obs;
  RxBool isExpanded = false.obs;
  RxInt eIndex = 0.obs;

  RxList<Leagues> leaguesMatchList = <Leagues>[].obs;
  Rx<AllLeaguesModel> allLeaguesModel = AllLeaguesModel().obs;
  RxList<LeagueModel> leaguesList = <LeagueModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    generateDates();

    tabController = TabController(length: dates.length, vsync: this, initialIndex: getTodayIndex());

    tabController.addListener(_handleTabSelection);

    loadInitialMatches();
  }

  void generateDates() {
    dates.clear();

    DateTime start = DateTime(today.year, today.month - 2, today.day);
    DateTime end = DateTime(today.year, today.month + 2, today.day);

    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
  }

  Future<void> loadInitialMatches() async {
    final timezoneInfo = await FlutterTimezone.getLocalTimezone();

    timezone = timezoneInfo.identifier;

    final formattedDate = formatApiDate(today);
    await getAllLeagues();
    await getMatches(date: formattedDate);
  }

  String formatApiDate(DateTime date) {
    return DateFormat('yyyyMMdd').format(date);
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
      final selected = dates[tabController.index];
      final formattedDate = formatApiDate(selected);

      if (lastLoadedDate != formattedDate) {
        getMatches(date: formattedDate);
      }
    }
  }

  Future<void> getMatches({String? date}) async {
    try {
      isMatchesLoader.value = true;
      final matchData = await HomeService().matches(date: date, timeZone: timezone, ccode3: "IND");

      leaguesMatchList.addAll(matchData.leagues ?? []);

      if (date != null) {
        lastLoadedDate = date;
      }
    } catch (e) {
      log("getMatches error: $e");
      rethrow;
    } finally {
      isMatchesLoader.value = false;
    }
  }

  Future<void> getAllLeagues({String? locale, String? ccode3}) async {
    try {
      isMatchesLoader.value = true;

      final data = await HomeService().allLeagues(locale: locale, ccode3: ccode3);

      allLeaguesModel.value = data;

      leaguesList.assignAll([
        ...?data.popular,
        ...?data.international,
        ...?data.countries?.expand((country) => country.leagues ?? <LeagueModel>[]),
      ]);
    } catch (e) {
      log("getAllLeagues error: $e");
      rethrow;
    } finally {
      isMatchesLoader.value = false;
    }
  }

  String getLeagueLocalizedNameById(int id) {
    final league = leaguesList.firstWhereOrNull((element) => element.id == id);

    return league?.localizedName ?? '';
  }

  @override
  void onClose() {
    tabController.removeListener(_handleTabSelection);
    tabController.dispose();
    super.onClose();
  }
}
