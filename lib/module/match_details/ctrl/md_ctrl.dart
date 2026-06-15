import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:goalscore/module/match_details/model/m_bast_player_m.dart';
import 'package:goalscore/module/match_details/model/m_commentry_m.dart';
import 'package:goalscore/module/match_details/model/m_incident_m.dart';
import 'package:goalscore/module/match_details/model/m_lineup_m.dart';
import 'package:goalscore/module/match_details/model/m_next_matches_m.dart';
import 'package:goalscore/module/match_details/model/m_relevant_matches_m.dart';
import 'package:goalscore/module/match_details/model/m_stats_m.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart' as match_detail;
import 'package:goalscore/module/match_details/model/n_next_match_model.dart';
import 'package:goalscore/module/match_details/model/player_of_match_model.dart';
import 'package:goalscore/module/match_details/service/md_ser.dart';
import 'package:goalscore/utils/utils.dart';

class MdCtrl extends GetxController {
  RxBool isMDLoader = false.obs;
  RxBool isPOMDLoader = false.obs;
  RxBool isMStatsDataLoader = false.obs;
  RxBool isBestPlayer = false.obs;
  RxBool isNextMatches = false.obs;
  RxBool isRelevantMatches = false.obs;
  RxBool isMIncident = false.obs;
  RxBool isMCommentry = false.obs;
  RxBool isMLineup = false.obs;

  RxInt sStatsIndex = 0.obs;

  RxString league = "".obs;

  // Rx<MDEvent?> mdEvent = Rx(null);
  Rx<POMData?> pOMData = Rx(null);
  Rx<MStatsData?> mStatsData = Rx(null);
  Rx<Statistics?> mAllStatsData = Rx(null);
  Rx<StatisticsItems?> possession = Rx(null);
  Rx<StatisticsItems?> sPossession = Rx(null);
  RxList<StatisticsItems>? statisticsItems = <StatisticsItems>[].obs;
  Rx<BPData?> bpData = Rx(null);
  RxList<NMData>? nMatchesList = <NMData>[].obs;
  RxList<RMData>? rMatchesList = <RMData>[].obs;
  Rx<IncidentData?> mIncidentData = Rx(null);

  Rx<LineupData?> mLineupData = Rx(null);
  RxList<Players> hBenchPlayer = <Players>[].obs;
  RxList<Players> aBenchPlayer = <Players>[].obs;
  RxList<MissingPlayers> hInjuriesPlayer = <MissingPlayers>[].obs;
  RxList<MissingPlayers> aInjuriesPlayer = <MissingPlayers>[].obs;
  RxList<MissingPlayers> hSuspensionsPlayer = <MissingPlayers>[].obs;
  RxList<MissingPlayers> aSuspensionsPlayer = <MissingPlayers>[].obs;

  RxList<Map<String, dynamic>> homePositions = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> awayPositions = <Map<String, dynamic>>[].obs;

  RxList<Comments> commentList = <Comments>[].obs;

  // new  --------------------
  Rxn<match_detail.Header> matchHeader = Rxn<match_detail.Header>();
  Rxn<match_detail.MatchFacts> matchFacts = Rxn<match_detail.MatchFacts>();
  Rxn<match_detail.Weather> matchWeather = Rxn<match_detail.Weather>();
  Rxn<match_detail.MatchStats> matchStats = Rxn<match_detail.MatchStats>();
  Rxn<NewNextMatchModel> homeNewNextMatch = Rxn<NewNextMatchModel>();
  Rxn<NewNextMatchModel> awayNewNextMatch = Rxn<NewNextMatchModel>();

  Future<void> getNewMD({int? id}) async {
    try {
      isMDLoader.value = true;
      matchHeader.value = null;
      matchFacts.value = null;
      matchStats.value = null;
      matchWeather.value = null;
      final data = await MdSer().newMatchDetail(id: id);
      matchHeader.value = data.header;
      matchFacts.value = data.content?.matchFacts;
      matchStats.value = data.content?.stats;
      matchWeather.value = data.content?.weather;

      isMDLoader.value = false;
    } catch (e) {
      isMDLoader.value = false;
      rethrow;
    }
  }

  Future<void> getNewNextMatch({required int homeTeamId, required int awayTeamId}) async {
    try {
      homeNewNextMatch.value = null;
      awayNewNextMatch.value = null;

      final results = await Future.wait([MdSer().newNextMatch(id: homeTeamId), MdSer().newNextMatch(id: awayTeamId)]);

      homeNewNextMatch.value = results[0];
      awayNewNextMatch.value = results[1];
    } catch (e) {
      rethrow;
    }
  }

  // new  --------------------

  /*  Future<void> getMD({String? id}) async {
    try {
      isMDLoader.value = true;
      mdEvent.value = null;
      final even = await MdSer().matchDetail(id: id);
      mdEvent.value = even.data?.event;
      isMDLoader.value = false;
    } catch (e) {
      isMDLoader.value = false;
      rethrow;
    }
  }*/

  Future<void> getPOMData({String? id}) async {
    try {
      isPOMDLoader.value = true;
      pOMData.value = null;
      final even = await MdSer().playerOfMatch(id: id);
      pOMData.value = even.data;
      isPOMDLoader.value = false;
    } catch (e) {
      isPOMDLoader.value = false;
      rethrow;
    }
  }

  Future<void> getMStats({String? id, String? hId, String? aId}) async {
    try {
      isMStatsDataLoader.value = true;
      mAllStatsData.value = null;
      mStatsData.value = null;
      possession.value = null;
      statisticsItems?.clear();
      final statsData = await MdSer().mStats(id: id, hId: hId, aId: aId);
      mStatsData.value = statsData.data;
      _extractPossession(statsData.data);
      statisticsItems?.addAll(statsData.data?.statistics?[0].groups?[0].statisticsItems ?? []);
      isMStatsDataLoader.value = false;
      statsChange(state: "all");
    } catch (e) {
      isMStatsDataLoader.value = false;
      rethrow;
    }
  }

  Future<void> getBestPlayer({String? id}) async {
    try {
      isBestPlayer.value = true;
      bpData.value = null;
      final even = await MdSer().bestPlayer(id: id);
      bpData.value = even.data;
      isBestPlayer.value = false;
    } catch (e) {
      isBestPlayer.value = false;
      rethrow;
    }
  }

  Future<void> getNextMatches({String? id}) async {
    try {
      isNextMatches.value = true;
      nMatchesList?.clear();
      final even = await MdSer().nextMatches(id: id);
      nMatchesList?.addAll(even.data ?? []);
      isNextMatches.value = false;
    } catch (e) {
      isNextMatches.value = false;
      rethrow;
    }
  }

  Future<void> getRelevantMatches({String? id}) async {
    try {
      isRelevantMatches.value = true;
      rMatchesList?.clear();
      final even = await MdSer().relevantMatches(id: id);
      rMatchesList?.addAll(even.data ?? []);
      isRelevantMatches.value = false;
    } catch (e) {
      isRelevantMatches.value = false;
      rethrow;
    }
  }

  Future<void> getMatchIncident({String? id}) async {
    try {
      isMIncident.value = true;
      mIncidentData.value = null;
      final even = await MdSer().matchIncident(id: id);
      mIncidentData.value = even.data;
      isMIncident.value = false;
    } catch (e) {
      isMIncident.value = false;
      rethrow;
    }
  }

  Future<void> getMatchCommentry({String? id}) async {
    try {
      isMCommentry.value = true;
      commentList.clear();
      final even = await MdSer().matchCommentry(id: id);
      final reversedComments = even.data?.comments?.reversed.toList() ?? [];
      commentList.addAll(reversedComments);
      isMCommentry.value = false;
    } catch (e) {
      isMCommentry.value = false;
      rethrow;
    }
  }

  Future<void> getMatchLineup({String? id}) async {
    try {
      isMLineup.value = true;
      mLineupData.value = null;
      hBenchPlayer.clear();
      aBenchPlayer.clear();
      hInjuriesPlayer.clear();
      aInjuriesPlayer.clear();
      hSuspensionsPlayer.clear();
      aSuspensionsPlayer.clear();
      final even = await MdSer().matchLineUp(id: id);
      mLineupData.value = even.data;
      hBenchPlayer.value = even.data?.home?.players?.where((element) => element.substitute == true).toList() ?? [];
      aBenchPlayer.value = even.data?.away?.players?.where((element) => element.substitute == true).toList() ?? [];
      hInjuriesPlayer.value = even.data?.home?.missingPlayers?.where((element) => element.reason == 1).toList() ?? [];
      aInjuriesPlayer.value = even.data?.away?.missingPlayers?.where((element) => element.reason == 1).toList() ?? [];
      hSuspensionsPlayer.value = even.data?.home?.missingPlayers?.where((element) => element.reason == 3).toList() ?? [];
      aSuspensionsPlayer.value = even.data?.away?.missingPlayers?.where((element) => element.reason == 3).toList() ?? [];
      setLineups(mLineupData.value);
      isMLineup.value = false;
    } catch (e) {
      isMLineup.value = false;
      rethrow;
    }
  }

  void setLineups(LineupData? data) {
    if (data?.home != null) {
      homePositions.value = buildHomePositions(team: data!.home!);
    }

    if (data?.away != null) {
      awayPositions.value = buildAwayPositions(team: data!.away!);
    }
  }

  List<Map<String, dynamic>> buildHomePositions({required TeamLineup team}) {
    List<Players> players = team.players?.where((p) => p.substitute == false).toList() ?? [];

    players.sort((a, b) => (a.counterOrder ?? 0).compareTo(b.counterOrder ?? 0));

    List<int> formation = team.formation?.split('-').map((e) => int.parse(e)).toList() ?? [];

    List<Map<String, dynamic>> positionedPlayers = [];

    if (players.isEmpty) return positionedPlayers;

    int totalLines = formation.length;

    double halfStart = 0.0;
    double halfEnd = 0.5;

    double availableHeight = halfEnd - halfStart;
    double verticalGap = availableHeight / (totalLines + 1);

    positionedPlayers.add({"player": players[0], "top": halfStart + 0.05, "left": 0.5});

    int start = 1;

    for (int i = 0; i < formation.length; i++) {
      int count = formation[i];

      double top = halfStart + (i + 1) * verticalGap;

      List<Players> rowPlayers = players.sublist(start, start + count);
      start += count;

      List<double> spacing = getUEFASpacing(rowPlayers.length);

      for (int j = 0; j < rowPlayers.length; j++) {
        positionedPlayers.add({"player": rowPlayers[j], "top": top + 0.055, "left": spacing[j]});
      }
    }

    return positionedPlayers;
  }

  List<Map<String, dynamic>> buildAwayPositions({required TeamLineup team}) {
    List<Players> players = team.players?.where((p) => p.substitute == false).toList() ?? [];

    players.sort((a, b) => (a.counterOrder ?? 0).compareTo(b.counterOrder ?? 0));

    List<int> formation = team.formation?.split('-').map((e) => int.parse(e)).toList() ?? [];

    List<Map<String, dynamic>> positionedPlayers = [];

    if (players.isEmpty) return positionedPlayers;

    int totalLines = formation.length;

    double halfStart = 0.5;
    double halfEnd = 1.0;

    double availableHeight = halfEnd - halfStart;
    double verticalGap = availableHeight / (totalLines + 1);

    positionedPlayers.add({"player": players[0], "top": halfEnd - 0.05, "left": 0.5});

    int start = 1;

    for (int i = 0; i < formation.length; i++) {
      int count = formation[i];

      double top = halfEnd - ((i + 1) * verticalGap);

      List<Players> rowPlayers = players.sublist(start, start + count);
      start += count;

      List<double> spacing = getUEFASpacing(rowPlayers.length);

      for (int j = 0; j < rowPlayers.length; j++) {
        positionedPlayers.add({"player": rowPlayers[j], "top": top - 0.055, "left": 1 - spacing[j]});
      }
    }

    return positionedPlayers;
  }

  Future<void> statsChange({required String state}) async {
    try {
      isMStatsDataLoader.value = true;

      mAllStatsData.value = null;
      sPossession.value = null;

      final stats = mStatsData.value?.statistics;

      if (stats == null) return;

      final targetPeriod = switch (state) {
        "all" => "ALL",
        "1st" => "1ST",
        "2nd" => "2ND",
        _ => "ALL",
      };

      final selected = stats.firstWhere((e) => e.period == targetPeriod, orElse: () => stats.first);

      mAllStatsData.value = selected;
      stateExtractPossession(selected);
    } catch (e) {
      rethrow;
    } finally {
      isMStatsDataLoader.value = false;
    }
  }

  void stateExtractPossession(Statistics? data) {
    final groups = data?.groups;

    if (groups == null) return;

    for (final group in groups) {
      if (group.groupName != "Possession") continue;

      final item = group.statisticsItems?.firstWhere(
        (e) => e.name == "ball_possession",
        orElse: () => group.statisticsItems!.first,
      );

      if (item != null) {
        sPossession.value = item;
        return;
      }
    }
  }

  void _extractPossession(MStatsData? data) {
    final groups = data?.statistics?[0].groups ?? [];

    for (final group in groups) {
      if (group.groupName == "Possession") {
        for (final item in group.statisticsItems ?? []) {
          if (item.name == "ball_possession") {
            possession.value = item;
            return;
          }
        }
      }
    }
  }
}
