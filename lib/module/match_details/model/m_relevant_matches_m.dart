class RelevantMatchesModel {
  int? code;
  int? errorCode;
  String? message;
  List<RMData>? data;

  RelevantMatchesModel({this.code, this.errorCode, this.message, this.data});

  RelevantMatchesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RMData>[];
      json['data'].forEach((v) {
        data!.add(RMData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['error_code'] = errorCode;
    data['message'] = message;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    return data;
  }
}

class RMData {
  String? id;
  int? startTimestamp;
  Tournament? tournament;
  RMStatus? status;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  String? stageId;
  RMTime? time;
  HomeScore? homeScore;
  HomeScore? awayScore;
  String? slug;
  RoundInfo? roundInfo;
  AggScore? aggScore;
  int? winnerCode;
  int? lineup;
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

  RMData({
    this.id,
    this.startTimestamp,
    this.tournament,
    this.status,
    this.homeTeam,
    this.awayTeam,
    this.stageId,
    this.time,
    this.homeScore,
    this.awayScore,
    this.slug,
    this.roundInfo,
    this.aggScore,
    this.winnerCode,
    this.lineup,
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
  });

  RMData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTimestamp = json['startTimestamp'];
    tournament = json['tournament'] != null ? Tournament.fromJson(json['tournament']) : null;
    status = json['status'] != null ? RMStatus.fromJson(json['status']) : null;
    homeTeam = json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam = json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
    stageId = json['stage_id'];
    time = json['time'] != null ? RMTime.fromJson(json['time']) : null;
    homeScore = json['homeScore'] != null ? HomeScore.fromJson(json['homeScore']) : null;
    awayScore = json['awayScore'] != null ? HomeScore.fromJson(json['awayScore']) : null;
    slug = json['slug'];
    roundInfo = json['roundInfo'] != null ? RoundInfo.fromJson(json['roundInfo']) : null;
    aggScore = json['agg_score'] != null ? AggScore.fromJson(json['agg_score']) : null;
    winnerCode = json['winnerCode'];
    lineup = json['lineup'];
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
    if (time != null) {
      data['time'] = time!.toJson();
    }
    if (homeScore != null) {
      data['homeScore'] = homeScore!.toJson();
    }
    if (awayScore != null) {
      data['awayScore'] = awayScore!.toJson();
    }
    data['slug'] = slug;
    if (roundInfo != null) {
      data['roundInfo'] = roundInfo!.toJson();
    }
    if (aggScore != null) {
      data['agg_score'] = aggScore!.toJson();
    }
    data['winnerCode'] = winnerCode;
    data['lineup'] = lineup;
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
    return data;
  }
}

class Tournament {
  String? id;
  int? priority;
  String? name;
  String? slug;
  int? groupNum;
  Category? category;
  String? primaryColor;
  String? secondaryColor;
  String? competitionAbbr;
  Category? section;

  Tournament({
    this.id,
    this.priority,
    this.name,
    this.slug,
    this.groupNum,
    this.category,
    this.primaryColor,
    this.secondaryColor,
    this.competitionAbbr,
    this.section,
  });

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    name = json['name'];
    slug = json['slug'];
    groupNum = json['group_num'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    competitionAbbr = json['competition_abbr'];
    section = json['section'] != null ? Category.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priority'] = priority;
    data['name'] = name;
    data['slug'] = slug;
    data['group_num'] = groupNum;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['primary_color'] = primaryColor;
    data['secondary_color'] = secondaryColor;
    data['competition_abbr'] = competitionAbbr;
    if (section != null) {
      data['section'] = section!.toJson();
    }
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

class RMStatus {
  int? code;
  String? type;
  String? description;

  RMStatus({this.code, this.type, this.description});

  RMStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['type'] = type;
    data['description'] = description;
    return data;
  }
}

class HomeTeam {
  String? id;
  String? name;
  String? slug;
  String? shortName;

  HomeTeam({this.id, this.name, this.slug, this.shortName});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['shortName'] = shortName;
    return data;
  }
}

class RMTime {
  RMStatus? status;
  int? currentPeriodStartTimestamp;
  int? announcedInjuryTime;

  RMTime({status, currentPeriodStartTimestamp, announcedInjuryTime});

  RMTime.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? RMStatus.fromJson(json['status']) : null;
    currentPeriodStartTimestamp = json['currentPeriodStartTimestamp'];
    announcedInjuryTime = json['announcedInjuryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['currentPeriodStartTimestamp'] = currentPeriodStartTimestamp;
    data['announcedInjuryTime'] = announcedInjuryTime;
    return data;
  }
}

class HomeScore {
  int? current;
  int? display;
  int? period1;
  int? period2;
  int? corner;
  int? yellowCard;
  int? redCard;
  int? overTimeScore;
  int? penaltyScore;
  int? overTimeScoreOnly;
  int? ftScoreOnly;

  HomeScore({
    this.current,
    this.display,
    this.period1,
    this.period2,
    this.corner,
    this.yellowCard,
    this.redCard,
    this.overTimeScore,
    this.penaltyScore,
    this.overTimeScoreOnly,
    this.ftScoreOnly,
  });

  HomeScore.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    display = json['display'];
    period1 = json['period1'];
    period2 = json['period2'];
    corner = json['corner'];
    yellowCard = json['yellow_card'];
    redCard = json['red_card'];
    overTimeScore = json['overTime_score'];
    penaltyScore = json['penalty_score'];
    overTimeScoreOnly = json['overTime_score_only'];
    ftScoreOnly = json['ft_score_only'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['display'] = display;
    data['period1'] = period1;
    data['period2'] = period2;
    data['corner'] = corner;
    data['yellow_card'] = yellowCard;
    data['red_card'] = redCard;
    data['overTime_score'] = overTimeScore;
    data['penalty_score'] = penaltyScore;
    data['overTime_score_only'] = overTimeScoreOnly;
    data['ft_score_only'] = ftScoreOnly;
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
