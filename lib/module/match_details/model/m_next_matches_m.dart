class NextMatchesModel {
  int? code;
  List<NMData>? data;
  String? message;

  NextMatchesModel({this.code, this.data, this.message});

  NextMatchesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <NMData>[];
      json['data'].forEach((v) {
        data!.add(NMData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class NMData {
  String? id;
  int? startTimestamp;
  Tournament? tournament;
  Status? status;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  String? stageId;
  String? seasonId;
  int? homeRedCards;
  int? awayRedCards;
  int? homeYellowCards;
  int? awayYellowCards;
  int? homeCornerKicks;
  int? awayCornerKicks;
  int? homePenalty;
  int? awayPenalty;
  int? homeShotOnTarget;
  int? awayShotOnTarget;
  String? stageName;
  int? isSameCompetition;

  NMData({
    this.id,
    this.startTimestamp,
    this.tournament,
    this.status,
    this.homeTeam,
    this.awayTeam,
    this.stageId,
    this.seasonId,
    this.homeRedCards,
    this.awayRedCards,
    this.homeYellowCards,
    this.awayYellowCards,
    this.homeCornerKicks,
    this.awayCornerKicks,
    this.homePenalty,
    this.awayPenalty,
    this.homeShotOnTarget,
    this.awayShotOnTarget,
    this.stageName,
    this.isSameCompetition,
  });

  NMData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTimestamp = json['startTimestamp'];
    tournament = json['tournament'] != null ? Tournament.fromJson(json['tournament']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    homeTeam = json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam = json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
    stageId = json['stage_id'];
    seasonId = json['season_id'];
    homeRedCards = json['homeRedCards'];
    awayRedCards = json['awayRedCards'];
    homeYellowCards = json['homeYellowCards'];
    awayYellowCards = json['awayYellowCards'];
    homeCornerKicks = json['homeCornerKicks'];
    awayCornerKicks = json['awayCornerKicks'];
    homePenalty = json['homePenalty'];
    awayPenalty = json['awayPenalty'];
    homeShotOnTarget = json['homeShotOnTarget'];
    awayShotOnTarget = json['awayShotOnTarget'];
    stageName = json['stage_name'];
    isSameCompetition = json['is_same_competition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startTimestamp'] = startTimestamp;
    if (tournament != null) {
      data['tournament'] = tournament!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    data['stage_id'] = stageId;
    data['season_id'] = seasonId;
    data['homeRedCards'] = homeRedCards;
    data['awayRedCards'] = awayRedCards;
    data['homeYellowCards'] = homeYellowCards;
    data['awayYellowCards'] = awayYellowCards;
    data['homeCornerKicks'] = homeCornerKicks;
    data['awayCornerKicks'] = awayCornerKicks;
    data['homePenalty'] = homePenalty;
    data['awayPenalty'] = awayPenalty;
    data['homeShotOnTarget'] = homeShotOnTarget;
    data['awayShotOnTarget'] = awayShotOnTarget;

    data['stage_name'] = stageName;
    data['is_same_competition'] = isSameCompetition;
    return data;
  }
}

class Tournament {
  String? id;
  String? name;

  Tournament({this.id, this.name});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Status {
  int? code;
  String? description;
  String? type;

  Status({this.code, this.description, this.type});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    data['type'] = type;
    return data;
  }
}

class HomeTeam {
  String? id;
  String? name;
  String? shortName;
  String? slug;

  HomeTeam({this.id, this.name, this.shortName, this.slug});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['slug'] = slug;
    return data;
  }
}

class RoundInfo {
  int? round;

  RoundInfo({this.round});

  RoundInfo.fromJson(Map<String, dynamic> json) {
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['round'] = round;
    return data;
  }
}

class AggScore {
  int? homeScore;
  int? awayScore;
  String? relatedId;

  AggScore({this.homeScore, this.awayScore, this.relatedId});

  AggScore.fromJson(Map<String, dynamic> json) {
    homeScore = json['home_score'];
    awayScore = json['away_score'];
    relatedId = json['related_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home_score'] = homeScore;
    data['away_score'] = awayScore;
    data['related_id'] = relatedId;
    return data;
  }
}
