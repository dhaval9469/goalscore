

import 'package:goalscore/helper/network_helper.dart';
import 'package:goalscore/module/home/model/matches_model.dart';

class HomeService {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<MatchesModel> matches() async {
    try {
      final response = await networkAPICall.get(
        "matches?date=20260312&timezone=Asia%2FCalcutta&ccode3=IND",
      );
      return MatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
