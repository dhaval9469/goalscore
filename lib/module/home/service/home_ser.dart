import 'package:goalscore/helper/network_helper.dart';
import 'package:goalscore/module/home/model/allleagues_model.dart';
import 'package:goalscore/module/home/model/new_matches_model.dart';

class HomeService {
  NetworkAPICall networkAPICall = NetworkAPICall();

  Future<NewMatchesModel> matches({String? date, String? timeZone, String? ccode3}) async {
    try {
      final response = await networkAPICall.get("matches?date=$date&timezone=$timeZone&ccode3=IND&includeNextDayLateNight=true");
      return NewMatchesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<AllLeaguesModel> allLeagues({String? locale, String? ccode3}) async {
    try {
      final response = await networkAPICall.get("allLeagues?locale=en&country=IND");
      return AllLeaguesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
