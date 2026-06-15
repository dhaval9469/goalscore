import 'dart:developer';

import 'package:goalscore/helper/network_helper.dart';
import 'package:goalscore/module/match_details/model/m_bast_player_m.dart';
import 'package:goalscore/module/match_details/model/m_commentry_m.dart';
import 'package:goalscore/module/match_details/model/m_incident_m.dart';
import 'package:goalscore/module/match_details/model/m_lineup_m.dart';
import 'package:goalscore/module/match_details/model/m_next_matches_m.dart';
import 'package:goalscore/module/match_details/model/m_relevant_matches_m.dart';
import 'package:goalscore/module/match_details/model/m_stats_m.dart';
import 'package:goalscore/module/match_details/model/match_detail_model.dart';
import 'package:goalscore/module/match_details/model/n_match_details_model.dart';
import 'package:goalscore/module/match_details/model/n_next_match_model.dart';
import 'package:goalscore/module/match_details/model/player_of_match_model.dart';

class MdSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<NewMatchDetailsModel> newMatchDetail({int? id}) async {
    try {
      final response = await networkAPICall.get("matchDetails?matchId=$id");
      return NewMatchDetailsModel.fromJson(response);
    } catch (e, st) {
      log("newMatchDetail ERROR---- : $e");
      log("newMatchDetail ERROR---- : $st");
      rethrow;
    }
  }

  Future<NewNextMatchModel> newNextMatch({int? id}) async {
    try {
      final response = await networkAPICall.get("nextmatch?teamId=$id");
      return NewNextMatchModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // -------- old --------------------
  Future<MatchDetailModel> matchDetail({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id?language=en-IN");
      return MatchDetailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PlayerOfMatchModel> playerOfMatch({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/player-of-match");
      return PlayerOfMatchModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchStatsModel> mStats({String? id, String? hId, String? aId}) async {
    try {
      final response = await networkAPICall.get("event/$id/home/$hId/away/$aId/statistics");
      return MatchStatsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<BestPlayerModel> bestPlayer({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/best-players/v2?language=en-IN");
      return BestPlayerModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NextMatchesModel> nextMatches({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/next-matches?language=en-IN");
      return NextMatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<RelevantMatchesModel> relevantMatches({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/relevant-matches?language=en-IN");
      return RelevantMatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchIncidentModel> matchIncident({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/incidents?language=en");
      return MatchIncidentModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchLineUpModel> matchLineUp({String? id}) async {
    try {
      final response = await networkAPICall.get("event/$id/lineups?language=en-IN");
      return MatchLineUpModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchLineUpModel> matchStats({String? id, String? hId, String? aId}) async {
    try {
      final response = await networkAPICall.get("event/$id/home/$hId/away/$aId/statistics");
      return MatchLineUpModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchCommentryModel> matchCommentry({String? id}) async {
    try {
      final response = await networkAPICall.get("", fUrl: "https://api.unik8s.com/api/v2/football/event/$id/tlives/en");
      return MatchCommentryModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
