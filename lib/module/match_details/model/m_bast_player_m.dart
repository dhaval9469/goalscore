class BestPlayerModel {
  int? code;
  BPData? data;
  String? message;

  BestPlayerModel({this.code, this.data, this.message});

  BestPlayerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? BPData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class BPData {
  List<BestHomeTeamPlayers>? bestHomeTeamPlayers;
  List<BestHomeTeamPlayers>? bestAwayTeamPlayers;
  String? mvp;

  BPData({this.bestHomeTeamPlayers, this.bestAwayTeamPlayers, this.mvp});

  BPData.fromJson(Map<String, dynamic> json) {
    if (json['bestHomeTeamPlayers'] != null) {
      bestHomeTeamPlayers = <BestHomeTeamPlayers>[];
      json['bestHomeTeamPlayers'].forEach((v) {
        bestHomeTeamPlayers!.add(BestHomeTeamPlayers.fromJson(v));
      });
    }
    if (json['bestAwayTeamPlayers'] != null) {
      bestAwayTeamPlayers = <BestHomeTeamPlayers>[];
      json['bestAwayTeamPlayers'].forEach((v) {
        bestAwayTeamPlayers!.add(BestHomeTeamPlayers.fromJson(v));
      });
    }
    mvp = json['mvp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bestHomeTeamPlayers != null) {
      data['bestHomeTeamPlayers'] = bestHomeTeamPlayers!.map((v) => v.toJson()).toList();
    }
    if (bestAwayTeamPlayers != null) {
      data['bestAwayTeamPlayers'] = bestAwayTeamPlayers!.map((v) => v.toJson()).toList();
    }
    data['mvp'] = mvp;
    return data;
  }
}

class BestHomeTeamPlayers {
  String? label;
  Player? player;
  int? goals;
  int? assists;
  String? value;

  BestHomeTeamPlayers({this.label, this.player, this.goals, this.assists, this.value});

  BestHomeTeamPlayers.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    goals = json['goals'];
    assists = json['assists'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    data['goals'] = goals;
    data['assists'] = assists;
    data['value'] = value;
    return data;
  }
}

class Player {
  String? name;
  String? id;
  String? slug;

  Player({this.name, this.id, this.slug});

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['slug'] = slug;
    return data;
  }
}
