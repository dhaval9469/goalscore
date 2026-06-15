class MatchDetailModel {
  int? code;
  Data? data;
  String? message;

  MatchDetailModel({code, data, message});

  MatchDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = this.data!.toJson();
    data['message'] = message;
    return data;
  }
}

class Data {
  MDEvent? event;

  Data({event});

  Data.fromJson(Map<String, dynamic> json) {
    event = json['event'] != null ? MDEvent.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (event != null) {
      data['event'] = event!.toJson();
    }
    return data;
  }
}

class MDEvent {
  String? id;
  int? startTimestamp;
  String? startDt;
  Tournament? tournament;
  RoundInfo? roundInfo;
  String? slug;
  Status? status;
  int? winnerCode;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  HomeScore? homeScore;
  HomeScore? awayScore;
  Time? time;
  Referee? referee;
  Venue? venue;
  int? lineup;
  String? stageId;
  Season? season;
  AggScore? aggScore;
  bool? hasStanding;
  bool? hasPlayerStats;
  bool? hasBracket;
  Environment? environment;
  bool? hasHighlight;
  bool? hasCommentary;
  bool? hasAdvancedStats;
  bool? hasPrediction;
  bool? hasOdds;
  ScoresDetail? scoresDetail;

  MDEvent({
    id,
    startTimestamp,
    startDt,
    tournament,
    roundInfo,
    slug,
    status,
    winnerCode,
    homeTeam,
    awayTeam,
    homeScore,
    awayScore,
    time,
    referee,
    venue,
    lineup,
    stageId,
    season,
    aggScore,
    hasStanding,
    hasPlayerStats,
    hasBracket,
    environment,
    hasHighlight,
    hasCommentary,
    hasAdvancedStats,
    hasPrediction,
    hasOdds,
    scoresDetail,
  });

  MDEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTimestamp = json['startTimestamp'];
    startDt = json['startDt'];
    tournament = json['tournament'] != null ? Tournament.fromJson(json['tournament']) : null;
    roundInfo = json['roundInfo'] != null ? RoundInfo.fromJson(json['roundInfo']) : null;
    slug = json['slug'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    winnerCode = json['winnerCode'];
    homeTeam = json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam = json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
    homeScore = json['homeScore'] != null ? HomeScore.fromJson(json['homeScore']) : null;
    awayScore = json['awayScore'] != null ? HomeScore.fromJson(json['awayScore']) : null;
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    referee = json['referee'] != null ? Referee.fromJson(json['referee']) : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    lineup = json['lineup'];
    stageId = json['stage_id'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    aggScore = json['agg_score'] != null ? AggScore.fromJson(json['agg_score']) : null;
    hasStanding = json['has_standing'];
    hasPlayerStats = json['has_player_stats'];
    hasBracket = json['has_bracket'];
    environment = json['environment'] != null ? Environment.fromJson(json['environment']) : null;
    hasHighlight = json['has_highlight'];
    hasCommentary = json['has_commentary'];
    hasAdvancedStats = json['has_advanced_stats'];
    hasPrediction = json['has_prediction'];
    hasOdds = json['has_odds'];
    scoresDetail = json['scores_detail'] != null ? ScoresDetail.fromJson(json['scores_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startTimestamp'] = startTimestamp;
    data['startDt'] = startDt;
    if (tournament != null) {
      data['tournament'] = tournament!.toJson();
    }
    if (roundInfo != null) {
      data['roundInfo'] = roundInfo!.toJson();
    }
    data['slug'] = slug;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['winnerCode'] = winnerCode;
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    if (homeScore != null) {
      data['homeScore'] = homeScore!.toJson();
    }
    if (awayScore != null) {
      data['awayScore'] = awayScore!.toJson();
    }
    if (time != null) {
      data['time'] = time!.toJson();
    }
    if (referee != null) {
      data['referee'] = referee!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    data['lineup'] = lineup;
    data['stage_id'] = stageId;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (aggScore != null) {
      data['agg_score'] = aggScore!.toJson();
    }
    data['has_standing'] = hasStanding;
    data['has_player_stats'] = hasPlayerStats;
    data['has_bracket'] = hasBracket;
    if (environment != null) {
      data['environment'] = environment!.toJson();
    }
    data['has_highlight'] = hasHighlight;
    data['has_commentary'] = hasCommentary;
    data['has_advanced_stats'] = hasAdvancedStats;
    data['has_prediction'] = hasPrediction;
    data['has_odds'] = hasOdds;
    if (scoresDetail != null) {
      data['scores_detail'] = scoresDetail!.toJson();
    }
    return data;
  }
}

class Tournament {
  String? id;
  int? priority;
  String? name;
  String? slug;
  Category? category;
  String? logo;
  int? groupNum;
  UniqueTournament? uniqueTournament;

  Tournament({id, priority, name, slug, category, logo, groupNum, uniqueTournament});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    logo = json['logo'];
    groupNum = json['group_num'];
    uniqueTournament = json['uniqueTournament'] != null ? UniqueTournament.fromJson(json['uniqueTournament']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priority'] = priority;
    data['name'] = name;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['logo'] = logo;
    data['group_num'] = groupNum;
    if (uniqueTournament != null) {
      data['uniqueTournament'] = uniqueTournament!.toJson();
    }
    return data;
  }
}

class Category {
  String? name;
  String? slug;
  String? id;
  String? flag;
  String? logo;

  Category({name, slug, id, flag, logo});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    flag = json['flag'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['id'] = id;
    data['flag'] = flag;
    data['logo'] = logo;
    return data;
  }
}

class UniqueTournament {
  String? id;
  String? name;
  String? slug;
  Category? category;

  UniqueTournament({id, name, slug, category});

  UniqueTournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class RoundInfo {
  int? round;

  RoundInfo({round});

  RoundInfo.fromJson(Map<String, dynamic> json) {
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['round'] = round;
    return data;
  }
}

class Status {
  int? code;
  String? description;
  String? type;

  Status({code, description, type});

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
  String? slug;
  String? shortName;
  Sport? sport;
  int? userCount;
  bool? disabled;
  int? type;
  City? country;
  Sport? teamColors;
  String? logo;

  HomeTeam({id, name, slug, shortName, sport, userCount, disabled, type, country, teamColors, logo});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    shortName = json['shortName'];
    sport = json['sport'] != null ? Sport.fromJson(json['sport']) : null;
    userCount = json['userCount'];
    disabled = json['disabled'];
    type = json['type'];
    country = json['country'] != null ? City.fromJson(json['country']) : null;
    teamColors = json['teamColors'] != null ? Sport.fromJson(json['teamColors']) : null;
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['shortName'] = shortName;
    if (sport != null) {
      data['sport'] = sport!.toJson();
    }
    data['userCount'] = userCount;
    data['disabled'] = disabled;
    data['type'] = type;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (teamColors != null) {
      data['teamColors'] = teamColors!.toJson();
    }
    data['logo'] = logo;
    return data;
  }
}

class Sport {
  Sport();

  Sport.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    current,
    display,
    period1,
    period2,
    corner,
    yellowCard,
    redCard,
    overTimeScore,
    penaltyScore,
    overTimeScoreOnly,
    ftScoreOnly,
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

class Time {
  int? announcedInjuryTime;

  Time({announcedInjuryTime});

  Time.fromJson(Map<String, dynamic> json) {
    announcedInjuryTime = json['announcedInjuryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['announcedInjuryTime'] = announcedInjuryTime;
    return data;
  }
}

class Referee {
  String? id;
  String? name;
  City? country;
  Stats? stats;

  Referee({id, name, country, stats});

  Referee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'] != null ? City.fromJson(json['country']) : null;
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Country {
  String? id;
  String? name;

  Country({id, name});

  Country.fromJson(Map<String, dynamic> json) {
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

class Stats {
  int? totalMatch;
  int? totalRedCard;
  int? totalYellowCard;

  Stats({totalMatch, totalRedCard, totalYellowCard});

  Stats.fromJson(Map<String, dynamic> json) {
    totalMatch = json['total_match'];
    totalRedCard = json['total_red_card'];
    totalYellowCard = json['total_yellow_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_match'] = totalMatch;
    data['total_red_card'] = totalRedCard;
    data['total_yellow_card'] = totalYellowCard;
    return data;
  }
}

class Venue {
  String? id;
  City? city;
  Stadium? stadium;
  City? country;

  Venue({id, city, stadium, country});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    stadium = json['stadium'] != null ? Stadium.fromJson(json['stadium']) : null;
    country = json['country'] != null ? City.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (stadium != null) {
      data['stadium'] = stadium!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class City {
  String? name;

  City({name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Stadium {
  String? name;
  int? capacity;

  Stadium({name, capacity});

  Stadium.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capacity'] = capacity;
    return data;
  }
}

class Season {
  String? id;
  String? year;
  bool? editor;
  Sport? seasonCoverageInfo;

  Season({id, year, editor, seasonCoverageInfo});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    editor = json['editor'];
    seasonCoverageInfo = json['seasonCoverageInfo'] != null ? Sport.fromJson(json['seasonCoverageInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['year'] = year;
    data['editor'] = editor;
    if (seasonCoverageInfo != null) {
      data['seasonCoverageInfo'] = seasonCoverageInfo!.toJson();
    }
    return data;
  }
}

class AggScore {
  int? homeScore;
  int? awayScore;
  String? relatedId;

  AggScore({homeScore, awayScore, relatedId});

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

class Environment {
  int? weather;
  String? pressure;
  String? temperature;
  String? wind;
  String? humidity;

  Environment({weather, pressure, temperature, wind, humidity});

  Environment.fromJson(Map<String, dynamic> json) {
    weather = json['weather'];
    pressure = json['pressure'];
    temperature = json['temperature'];
    wind = json['wind'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weather'] = weather;
    data['pressure'] = pressure;
    data['temperature'] = temperature;
    data['wind'] = wind;
    data['humidity'] = humidity;
    return data;
  }
}

class ScoresDetail {
  List<HomeSD>? home;
  List<HomeSD>? away;

  ScoresDetail({home, away});

  ScoresDetail.fromJson(Map<String, dynamic> json) {
    if (json['home'] != null) {
      home = <HomeSD>[];
      json['home'].forEach((v) {
        home!.add(HomeSD.fromJson(v));
      });
    }
    if (json['away'] != null) {
      away = <HomeSD>[];
      json['away'].forEach((v) {
        away!.add(HomeSD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.map((v) => v.toJson()).toList();
    }
    if (away != null) {
      data['away'] = away!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeSD {
  String? id;
  String? name;
  String? min;

  HomeSD({id, name, min});

  HomeSD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['min'] = min;
    return data;
  }
}
