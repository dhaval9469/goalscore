import 'package:goalscore/helper/network_helper.dart';
import 'package:goalscore/module/home/model/matches_model.dart';

class HomeService {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<MatchesModel> matches({String? date}) async {
    try {
      final response = await networkAPICall.get(
        "matches?date=$date&timezone=Asia%2FCalcutta&ccode3=IND",
      );
      return MatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //   https://pub.fotmob.com/prod/pub/odds/mylocation
}
