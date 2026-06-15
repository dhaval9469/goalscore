class PlayerOfMatchModel {
  int? code;
  POMData? data;
  String? message;

  PlayerOfMatchModel({this.code, this.data, this.message});

  PlayerOfMatchModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? POMData.fromJson(json['data']) : null;
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

class POMData {
  String? label;
  Player? player;
  int? goals;
  int? assists;
  String? value;
  String? competitorId;

  POMData({this.label, this.player, this.goals, this.assists, this.value, this.competitorId});

  POMData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    goals = json['goals'];
    assists = json['assists'];
    value = json['value'];
    competitorId = json['competitor_id'];
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
    data['competitor_id'] = competitorId;
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
