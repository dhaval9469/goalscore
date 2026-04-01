import 'dart:convert';
import 'dart:developer';

import 'package:goalscore/helper/network_helper.dart';

class MdSer {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<void> matchDetails({String? id}) async {
    try {
      final response = await networkAPICall.get(
        "matchDetails?matchId=5206095",
        header: {
          "User-Agent":
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120 Safari/537.36",
          "Accept": "application/json",
          "Referer": "https://www.fotmob.com/",
          "Origin": "https://www.fotmob.com",
        },
      );
      log("message : ${jsonEncode(response)}");
      // return MatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
