import 'package:get/get.dart';
import 'package:goalscore/module/home/page/home.dart';
import 'package:goalscore/module/match_details/page/match_details.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String homePage = "/homePage";
  static const String matchDetails = "/matchDetails";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: homePage, page: () => HomePage(), transition: defaultTransition),
    GetPage(name: matchDetails, page: () => MatchDetails(), transition: defaultTransition),
  ];
}
