import 'package:get/get.dart';

class MdCtrl extends GetxController {
  List<Map<String, dynamic>> homeTeamGoals = [
    {"timeStr": "90 + 3", "type": "Goal", "isHome": true, "lastName": "Pasalic"},
  ];

  List<Map<String, dynamic>> awayTeamGoals = [
    {"timeStr": 12, "type": "Goal", "isHome": false, "lastName": "Stanisic"},
    {"timeStr": 22, "type": "Goal", "isHome": false, "lastName": "Olise"},
    {"timeStr": 25, "type": "Goal", "isHome": false, "lastName": "Gnabry"},
    {"timeStr": 52, "type": "Goal", "isHome": false, "lastName": "Jackson"},
    {"timeStr": 67, "type": "Goal", "isHome": false, "lastName": "Musiala"},
  ];
}
