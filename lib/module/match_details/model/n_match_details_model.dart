class NewMatchDetailsModel {
  General? general;
  Header? header;
  bool? ongoing;
  bool? hasPendingVAR;
  Content? content;

  NewMatchDetailsModel({this.general, this.header, this.ongoing, this.hasPendingVAR, this.content});

  NewMatchDetailsModel.fromJson(Map<String, dynamic> json) {
    general = json['general'] != null ? General.fromJson(json['general']) : null;
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    ongoing = json['ongoing'];
    hasPendingVAR = json['hasPendingVAR'];
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (general != null) {
      data['general'] = general!.toJson();
    }
    if (header != null) {
      data['header'] = header!.toJson();
    }
    data['ongoing'] = ongoing;
    data['hasPendingVAR'] = hasPendingVAR;
    if (content != null) {
      data['content'] = content!.toJson();
    }
    return data;
  }
}

class General {
  String? matchId;
  String? matchName;
  String? matchRound;
  int? leagueId;
  String? leagueName;
  String? leagueRoundName;
  int? parentLeagueId;
  String? countryCode;
  String? coverageLevel;
  String? matchTimeUTC;
  String? matchTimeUTCDate;
  bool? started;
  bool? finished;
  String? gender;

  General({
    this.matchId,
    this.matchName,
    this.matchRound,
    this.leagueId,
    this.leagueName,
    this.leagueRoundName,
    this.parentLeagueId,
    this.countryCode,
    this.coverageLevel,
    this.matchTimeUTC,
    this.matchTimeUTCDate,
    this.started,
    this.finished,
    this.gender,
  });

  General.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    matchName = json['matchName'];
    matchRound = json['matchRound'];
    leagueId = json['leagueId'];
    leagueName = json['leagueName'];
    leagueRoundName = json['leagueRoundName'];
    parentLeagueId = json['parentLeagueId'];
    countryCode = json['countryCode'];
    coverageLevel = json['coverageLevel'];
    matchTimeUTC = json['matchTimeUTC'];
    matchTimeUTCDate = json['matchTimeUTCDate'];
    started = json['started'];
    finished = json['finished'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['matchName'] = matchName;
    data['matchRound'] = matchRound;
    data['leagueId'] = leagueId;
    data['leagueName'] = leagueName;
    data['leagueRoundName'] = leagueRoundName;
    data['parentLeagueId'] = parentLeagueId;
    data['countryCode'] = countryCode;
    data['coverageLevel'] = coverageLevel;
    data['matchTimeUTC'] = matchTimeUTC;
    data['matchTimeUTCDate'] = matchTimeUTCDate;
    data['started'] = started;
    data['finished'] = finished;
    data['gender'] = gender;
    return data;
  }
}

class Header {
  List<HTeams>? teams;
  Status? status;
  HeaderEvents? events;

  Header({this.teams, this.status, this.events});

  Header.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <HTeams>[];
      json['teams'].forEach((v) {
        teams!.add(HTeams.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    events = json['events'] != null ? HeaderEvents.fromJson(json['events']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    return data;
  }
}

class HTeams {
  String? name;
  int? id;
  int? score;
  String? imageUrl;
  String? pageUrl;
  int? fifaRank;

  HTeams({this.name, this.id, this.score, this.imageUrl, this.pageUrl, this.fifaRank});

  HTeams.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    score = json['score'];
    imageUrl = json['imageUrl'];
    pageUrl = json['pageUrl'];
    fifaRank = json['fifaRank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['score'] = score;
    data['imageUrl'] = imageUrl;
    data['pageUrl'] = pageUrl;
    data['fifaRank'] = fifaRank;
    return data;
  }
}

class Status {
  String? utcTime;
  int? numberOfHomeRedCards;
  int? numberOfAwayRedCards;
  Halfs? halfs;
  bool? finished;
  bool? started;
  bool? cancelled;
  bool? awarded;
  String? scoreStr;
  Reason? reason;
  String? whoLostOnPenalties;
  String? whoLostOnAggregated;

  Status({
    this.utcTime,
    this.numberOfHomeRedCards,
    this.numberOfAwayRedCards,
    this.halfs,
    this.finished,
    this.started,
    this.cancelled,
    this.awarded,
    this.scoreStr,
    this.reason,
    this.whoLostOnPenalties,
    this.whoLostOnAggregated,
  });

  Status.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    numberOfHomeRedCards = json['numberOfHomeRedCards'];
    numberOfAwayRedCards = json['numberOfAwayRedCards'];
    halfs = json['halfs'] != null ? Halfs.fromJson(json['halfs']) : null;
    finished = json['finished'];
    started = json['started'];
    cancelled = json['cancelled'];
    awarded = json['awarded'];
    scoreStr = json['scoreStr'];
    reason = json['reason'] != null ? Reason.fromJson(json['reason']) : null;
    whoLostOnPenalties = json['whoLostOnPenalties'];
    whoLostOnAggregated = json['whoLostOnAggregated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['utcTime'] = utcTime;
    data['numberOfHomeRedCards'] = numberOfHomeRedCards;
    data['numberOfAwayRedCards'] = numberOfAwayRedCards;
    if (halfs != null) {
      data['halfs'] = halfs!.toJson();
    }
    data['finished'] = finished;
    data['started'] = started;
    data['cancelled'] = cancelled;
    data['awarded'] = awarded;
    data['scoreStr'] = scoreStr;
    if (reason != null) {
      data['reason'] = reason!.toJson();
    }
    data['whoLostOnPenalties'] = whoLostOnPenalties;
    data['whoLostOnAggregated'] = whoLostOnAggregated;
    return data;
  }
}

class Halfs {
  String? firstHalfStarted;
  String? firstHalfEnded;
  String? secondHalfStarted;
  String? secondHalfEnded;
  String? firstExtraHalfStarted;
  String? secondExtraHalfStarted;
  String? gameEnded;

  Halfs({
    this.firstHalfStarted,
    this.firstHalfEnded,
    this.secondHalfStarted,
    this.secondHalfEnded,
    this.firstExtraHalfStarted,
    this.secondExtraHalfStarted,
    this.gameEnded,
  });

  Halfs.fromJson(Map<String, dynamic> json) {
    firstHalfStarted = json['firstHalfStarted'];
    firstHalfEnded = json['firstHalfEnded'];
    secondHalfStarted = json['secondHalfStarted'];
    secondHalfEnded = json['secondHalfEnded'];
    firstExtraHalfStarted = json['firstExtraHalfStarted'];
    secondExtraHalfStarted = json['secondExtraHalfStarted'];
    gameEnded = json['gameEnded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstHalfStarted'] = firstHalfStarted;
    data['firstHalfEnded'] = firstHalfEnded;
    data['secondHalfStarted'] = secondHalfStarted;
    data['secondHalfEnded'] = secondHalfEnded;
    data['firstExtraHalfStarted'] = firstExtraHalfStarted;
    data['secondExtraHalfStarted'] = secondExtraHalfStarted;
    data['gameEnded'] = gameEnded;
    return data;
  }
}

class Reason {
  String? short;
  String? shortKey;
  String? long;
  String? longKey;

  Reason({this.short, this.shortKey, this.long, this.longKey});

  Reason.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    shortKey = json['shortKey'];
    long = json['long'];
    longKey = json['longKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short'] = short;
    data['shortKey'] = shortKey;
    data['long'] = long;
    data['longKey'] = longKey;
    return data;
  }
}

class HeaderEvents {
  Map<String, List<GoalEvent>>? homeTeamGoals;
  Map<String, List<GoalEvent>>? awayTeamGoals;
  Map<String, List<GoalEvent>>? homeTeamRedCards;
  Map<String, List<GoalEvent>>? awayTeamRedCards;

  HeaderEvents({this.homeTeamGoals, this.awayTeamGoals, this.homeTeamRedCards, this.awayTeamRedCards});

  HeaderEvents.fromJson(Map<String, dynamic> json) {
    homeTeamGoals = parseEventMap(json['homeTeamGoals']);
    awayTeamGoals = parseEventMap(json['awayTeamGoals']);
    homeTeamRedCards = parseEventMap(json['homeTeamRedCards']);
    awayTeamRedCards = parseEventMap(json['awayTeamRedCards']);
  }

  static Map<String, List<GoalEvent>>? parseEventMap(dynamic json) {
    if (json == null || json is! Map) return null;

    Map<String, List<GoalEvent>> data = {};

    json.forEach((key, value) {
      if (value is List) {
        data[key.toString()] = value.map((e) => GoalEvent.fromJson(e)).toList();
      }
    });

    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['homeTeamGoals'] = homeTeamGoals?.map((key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));

    data['awayTeamGoals'] = awayTeamGoals?.map((key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));

    data['homeTeamRedCards'] = homeTeamRedCards?.map((key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));

    data['awayTeamRedCards'] = awayTeamRedCards?.map((key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));

    return data;
  }
}

class GoalEvent {
  String? reactKey;
  dynamic timeStr; // because sometimes String: "90 + 4", sometimes int: 17
  String? type;
  int? time;
  int? overloadTime;
  int? eventId;
  GoalPlayer? player;
  int? homeScore;
  int? awayScore;
  String? profileUrl;
  dynamic overloadTimeStr; // because sometimes String: "+4", sometimes bool: false
  bool? isHome;
  bool? ownGoal;
  String? goalDescription;
  String? goalDescriptionKey;
  String? suffix;
  String? suffixKey;
  bool? isPenaltyShootoutEvent;
  String? nameStr;
  String? firstName;
  String? lastName;
  String? fullName;
  int? playerId;
  List<int>? newScore;
  dynamic penShootoutScore;
  ShotmapEvent? shotmapEvent;
  dynamic assistStr;
  dynamic assistProfileUrl;

  GoalEvent({
    this.reactKey,
    this.timeStr,
    this.type,
    this.time,
    this.overloadTime,
    this.eventId,
    this.player,
    this.homeScore,
    this.awayScore,
    this.profileUrl,
    this.overloadTimeStr,
    this.isHome,
    this.ownGoal,
    this.goalDescription,
    this.goalDescriptionKey,
    this.suffix,
    this.suffixKey,
    this.isPenaltyShootoutEvent,
    this.nameStr,
    this.firstName,
    this.lastName,
    this.fullName,
    this.playerId,
    this.newScore,
    this.penShootoutScore,
    this.shotmapEvent,
    this.assistStr,
    this.assistProfileUrl,
  });

  GoalEvent.fromJson(Map<String, dynamic> json) {
    reactKey = json['reactKey'];
    timeStr = json['timeStr'];
    type = json['type'];
    time = json['time'];
    overloadTime = json['overloadTime'];
    eventId = json['eventId'];
    player = json['player'] != null ? GoalPlayer.fromJson(json['player']) : null;
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];
    profileUrl = json['profileUrl'];
    overloadTimeStr = json['overloadTimeStr'];
    isHome = json['isHome'];
    ownGoal = json['ownGoal'];
    goalDescription = json['goalDescription'];
    goalDescriptionKey = json['goalDescriptionKey'];
    suffix = json['suffix'];
    suffixKey = json['suffixKey'];
    isPenaltyShootoutEvent = json['isPenaltyShootoutEvent'];
    nameStr = json['nameStr'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    playerId = json['playerId'];
    newScore = json['newScore'] != null ? List<int>.from(json['newScore']) : null;
    penShootoutScore = json['penShootoutScore'];
    shotmapEvent = json['shotmapEvent'] != null ? ShotmapEvent.fromJson(json['shotmapEvent']) : null;
    assistStr = json['assistStr'];
    assistProfileUrl = json['assistProfileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['reactKey'] = reactKey;
    data['timeStr'] = timeStr;
    data['type'] = type;
    data['time'] = time;
    data['overloadTime'] = overloadTime;
    data['eventId'] = eventId;

    if (player != null) {
      data['player'] = player!.toJson();
    }

    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;
    data['profileUrl'] = profileUrl;
    data['overloadTimeStr'] = overloadTimeStr;
    data['isHome'] = isHome;
    data['ownGoal'] = ownGoal;
    data['goalDescription'] = goalDescription;
    data['goalDescriptionKey'] = goalDescriptionKey;
    data['suffix'] = suffix;
    data['suffixKey'] = suffixKey;
    data['isPenaltyShootoutEvent'] = isPenaltyShootoutEvent;
    data['nameStr'] = nameStr;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['playerId'] = playerId;
    data['newScore'] = newScore;
    data['penShootoutScore'] = penShootoutScore;

    if (shotmapEvent != null) {
      data['shotmapEvent'] = shotmapEvent!.toJson();
    }

    data['assistStr'] = assistStr;
    data['assistProfileUrl'] = assistProfileUrl;

    return data;
  }
}

class GoalPlayer {
  int? id;
  String? name;
  String? profileUrl;

  GoalPlayer({this.id, this.name, this.profileUrl});

  GoalPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['profileUrl'] = profileUrl;
    return data;
  }
}

class ShotmapEvent {
  int? id;
  String? eventType;
  int? teamId;
  int? playerId;
  String? playerName;
  double? x;
  double? y;
  int? min;
  int? minAdded;
  bool? isBlocked;
  bool? isOnTarget;
  double? blockedX;
  double? blockedY;
  double? goalCrossedY;
  double? goalCrossedZ;
  double? expectedGoals;
  double? expectedGoalsOnTarget;
  String? shotType;
  String? situation;
  String? period;
  bool? isOwnGoal;
  OnGoalShot? onGoalShot;
  bool? isSavedOffLine;
  bool? isFromInsideBox;
  int? keeperId;
  String? firstName;
  String? lastName;
  String? fullName;
  String? teamColor;

  ShotmapEvent({
    this.id,
    this.eventType,
    this.teamId,
    this.playerId,
    this.playerName,
    this.x,
    this.y,
    this.min,
    this.minAdded,
    this.isBlocked,
    this.isOnTarget,
    this.blockedX,
    this.blockedY,
    this.goalCrossedY,
    this.goalCrossedZ,
    this.expectedGoals,
    this.expectedGoalsOnTarget,
    this.shotType,
    this.situation,
    this.period,
    this.isOwnGoal,
    this.onGoalShot,
    this.isSavedOffLine,
    this.isFromInsideBox,
    this.keeperId,
    this.firstName,
    this.lastName,
    this.fullName,
    this.teamColor,
  });

  ShotmapEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventType = json['eventType'];
    teamId = json['teamId'];
    playerId = json['playerId'];
    playerName = json['playerName'];
    x = (json['x'] as num?)?.toDouble();
    y = (json['y'] as num?)?.toDouble();
    min = json['min'];
    minAdded = json['minAdded'];
    isBlocked = json['isBlocked'];
    isOnTarget = json['isOnTarget'];
    blockedX = (json['blockedX'] as num?)?.toDouble();
    blockedY = (json['blockedY'] as num?)?.toDouble();
    goalCrossedY = (json['goalCrossedY'] as num?)?.toDouble();
    goalCrossedZ = (json['goalCrossedZ'] as num?)?.toDouble();
    expectedGoals = (json['expectedGoals'] as num?)?.toDouble();
    expectedGoalsOnTarget = (json['expectedGoalsOnTarget'] as num?)?.toDouble();
    shotType = json['shotType'];
    situation = json['situation'];
    period = json['period'];
    isOwnGoal = json['isOwnGoal'];
    onGoalShot = json['onGoalShot'] != null ? OnGoalShot.fromJson(json['onGoalShot']) : null;
    isSavedOffLine = json['isSavedOffLine'];
    isFromInsideBox = json['isFromInsideBox'];
    keeperId = json['keeperId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    teamColor = json['teamColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['eventType'] = eventType;
    data['teamId'] = teamId;
    data['playerId'] = playerId;
    data['playerName'] = playerName;
    data['x'] = x;
    data['y'] = y;
    data['min'] = min;
    data['minAdded'] = minAdded;
    data['isBlocked'] = isBlocked;
    data['isOnTarget'] = isOnTarget;
    data['blockedX'] = blockedX;
    data['blockedY'] = blockedY;
    data['goalCrossedY'] = goalCrossedY;
    data['goalCrossedZ'] = goalCrossedZ;
    data['expectedGoals'] = expectedGoals;
    data['expectedGoalsOnTarget'] = expectedGoalsOnTarget;
    data['shotType'] = shotType;
    data['situation'] = situation;
    data['period'] = period;
    data['isOwnGoal'] = isOwnGoal;

    if (onGoalShot != null) {
      data['onGoalShot'] = onGoalShot!.toJson();
    }

    data['isSavedOffLine'] = isSavedOffLine;
    data['isFromInsideBox'] = isFromInsideBox;
    data['keeperId'] = keeperId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['teamColor'] = teamColor;

    return data;
  }
}

class OnGoalShot {
  double? x;
  double? y;
  double? zoomRatio;

  OnGoalShot({this.x, this.y, this.zoomRatio});

  OnGoalShot.fromJson(Map<String, dynamic> json) {
    x = (json['x'] as num?)?.toDouble();
    y = (json['y'] as num?)?.toDouble();
    zoomRatio = (json['zoomRatio'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['x'] = x;
    data['y'] = y;
    data['zoomRatio'] = zoomRatio;

    return data;
  }
}

class Content {
  MatchFacts? matchFacts;
  MatchStats? stats;
  Map<String, PlayerStatsData>? playerStats;
  Weather? weather;
  Lineup? lineup;
  bool? hasPlayoff;
  MatchTable? table;
  H2h? h2h;
  String? heatmapUrl;

  Content({this.matchFacts, this.stats, this.playerStats, this.weather, this.lineup, this.hasPlayoff, this.table, this.h2h});

  Content.fromJson(Map<String, dynamic> json) {
    matchFacts = json['matchFacts'] != null ? MatchFacts.fromJson(json['matchFacts']) : null;
    stats = json['stats'] != null ? MatchStats.fromJson(json['stats']) : null;
    if (json['playerStats'] != null) {
      playerStats = <String, PlayerStatsData>{};

      json['playerStats'].forEach((key, value) {
        playerStats![key.toString()] = PlayerStatsData.fromJson(value);
      });
    }
    weather = json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    lineup = json['lineup'] != null ? Lineup.fromJson(json['lineup']) : null;
    hasPlayoff = json['hasPlayoff'];
    table = json['table'] != null ? MatchTable.fromJson(json['table']) : null;
    final h2hJson = json['h2h'];
    if (h2hJson is Map) {
      h2h = H2h.fromJson(Map<String, dynamic>.from(h2hJson));
    } else {
      h2h = null;
    }
    heatmapUrl = json['heatmapUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchFacts != null) {
      data['matchFacts'] = matchFacts!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    if (playerStats != null) {
      data['playerStats'] = playerStats!.map((key, value) => MapEntry(key, value.toJson()));
    }
    if (weather != null) {
      data['weather'] = weather!.toJson();
    }
    if (lineup != null) {
      data['lineup'] = lineup!.toJson();
    }
    data['hasPlayoff'] = hasPlayoff;

    if (table != null) {
      data['table'] = table!.toJson();
    }
    if (h2h != null) {
      data['h2h'] = h2h!.toJson();
    } else {
      data['h2h'] = false;
    }

    data['heatmapUrl'] = heatmapUrl;
    return data;
  }
}

class MatchFacts {
  int? matchId;
  PlayerOfTheMatch? playerOfTheMatch;
  MatchFactsEvents? events;
  InfoBox? infoBox;
  List<List<MFTeamForm>>? teamForm;
  TopPlayers? topPlayers;
  List<Insights>? insights;
  String? countryCode;

  MatchFacts({
    this.matchId,
    this.playerOfTheMatch,
    this.events,
    this.infoBox,
    this.teamForm,
    this.topPlayers,
    this.insights,
    this.countryCode,
  });

  MatchFacts.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    playerOfTheMatch = json['playerOfTheMatch'] != null ? new PlayerOfTheMatch.fromJson(json['playerOfTheMatch']) : null;
    events = json['events'] != null ? MatchFactsEvents.fromJson(json['events']) : null;
    infoBox = json['infoBox'] != null ? InfoBox.fromJson(json['infoBox']) : null;
    if (json['teamForm'] != null) {
      teamForm = <List<MFTeamForm>>[];

      json['teamForm'].forEach((teamList) {
        List<MFTeamForm> forms = [];

        if (teamList is List) {
          for (var v in teamList) {
            forms.add(MFTeamForm.fromJson(v));
          }
        }

        teamForm!.add(forms);
      });
    }
    topPlayers = json['topPlayers'] != null ? TopPlayers.fromJson(json['topPlayers']) : null;
    if (json['insights'] != null) {
      insights = <Insights>[];
      json['insights'].forEach((v) {
        insights!.add(Insights.fromJson(v));
      });
    }
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    if (playerOfTheMatch != null) {
      data['playerOfTheMatch'] = playerOfTheMatch!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    if (infoBox != null) {
      data['infoBox'] = infoBox!.toJson();
    }
    if (teamForm != null) {
      data['teamForm'] = teamForm!.map((teamList) => teamList.map((v) => v.toJson()).toList()).toList();
    }
    if (topPlayers != null) {
      data['topPlayers'] = topPlayers!.toJson();
    }
    if (insights != null) {
      data['insights'] = insights!.map((v) => v.toJson()).toList();
    }
    data['countryCode'] = countryCode;
    return data;
  }
}

class PlayerOfTheMatch {
  int? id;
  POMName? name;
  String? teamName;
  int? teamId;
  POMRating? rating;
  List<POMStats>? stats;

  PlayerOfTheMatch({this.id, this.name, this.teamName, this.teamId, this.rating, this.stats});

  PlayerOfTheMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? POMName.fromJson(json['name']) : null;
    teamName = json['teamName'];
    teamId = json['teamId'];
    rating = json['rating'] != null ? POMRating.fromJson(json['rating']) : null;
    stats = json['stats'] is List
        ? (json['stats'] as List).whereType<Map>().map((e) => POMStats.fromJson(Map<String, dynamic>.from(e))).toList()
        : [];
  }

  int get goalsCount {
    for (final category in stats ?? <POMStats>[]) {
      final directGoals = category.stats?['Goals']?.stat?.value;

      if (directGoals != null) {
        return _toInt(directGoals);
      }

      for (final item in category.stats?.values ?? <POMStatItem>[]) {
        if (item.key?.toLowerCase() == 'goals') {
          return _toInt(item.stat?.value);
        }
      }
    }

    return 0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['teamName'] = teamName;
    data['teamId'] = teamId;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class POMStats {
  String? title;
  String? key;
  Map<String, POMStatItem>? stats;

  POMStats({this.title, this.key, this.stats});

  POMStats.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    key = json['key']?.toString();

    if (json['stats'] is Map) {
      stats = <String, POMStatItem>{};

      (json['stats'] as Map).forEach((key, value) {
        if (value is Map) {
          stats![key.toString()] = POMStatItem.fromJson(Map<String, dynamic>.from(value));
        }
      });
    } else {
      stats = {};
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['key'] = key;

    if (stats != null) {
      data['stats'] = stats!.map((key, value) => MapEntry(key, value.toJson()));
    }

    return data;
  }
}

class POMStatItem {
  String? key;
  POMStatValue? stat;
  bool? hideInPopupCard;

  POMStatItem({this.key, this.stat, this.hideInPopupCard});

  POMStatItem.fromJson(Map<String, dynamic> json) {
    key = json['key']?.toString();

    stat = json['stat'] is Map ? POMStatValue.fromJson(Map<String, dynamic>.from(json['stat'])) : null;

    hideInPopupCard = json['hideInPopupCard'] is bool ? json['hideInPopupCard'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['key'] = key;

    if (stat != null) {
      data['stat'] = stat!.toJson();
    }

    if (hideInPopupCard != null) {
      data['hideInPopupCard'] = hideInPopupCard;
    }

    return data;
  }
}

class POMStatValue {
  dynamic value;
  dynamic total;
  String? type;

  POMStatValue({this.value, this.total, this.type});

  POMStatValue.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    total = json['total'];
    type = json['type']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['value'] = value;

    if (total != null) {
      data['total'] = total;
    }

    data['type'] = type;

    return data;
  }
}

class POMName {
  String? firstName;
  String? lastName;
  String? fullName;

  POMName({this.firstName, this.lastName, this.fullName});

  POMName.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    return data;
  }
}

class POMRating {
  String? num;

  POMRating({this.num});

  POMRating.fromJson(Map<String, dynamic> json) {
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    return data;
  }
}

class MatchFactsEvents {
  bool? ongoing;
  List<MFEventsList>? events;
  Null? penaltyShootoutEvents;

  MatchFactsEvents({this.ongoing, this.events, this.penaltyShootoutEvents});

  MatchFactsEvents.fromJson(Map<String, dynamic> json) {
    ongoing = json['ongoing'];
    if (json['events'] != null) {
      events = <MFEventsList>[];
      json['events'].forEach((v) {
        events!.add(MFEventsList.fromJson(v));
      });
    }
    penaltyShootoutEvents = json['penaltyShootoutEvents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ongoing'] = ongoing;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    data['penaltyShootoutEvents'] = penaltyShootoutEvents;
    return data;
  }
}

class MFEventsList {
  String? reactKey;
  String? type;
  int? time;
  int? overloadTime;
  int? eventId;
  GoalPlayer? player;
  int? homeScore;
  int? awayScore;
  String? profileUrl;
  bool? isHome;
  String? nameStr;
  String? firstName;
  String? lastName;
  String? fullName;
  int? playerId;
  String? card;
  String? cardDescription;
  bool? ownGoal;
  String? goalDescription;
  String? goalDescriptionKey;
  String? suffix;
  String? suffixKey;
  bool? isPenaltyShootoutEvent;
  List<int>? newScore;
  String? assistStr;
  String? assistProfileUrl;
  String? minutesAddedStr;
  String? minutesAddedKey;
  int? minutesAddedInput;
  String? halfStrShort;
  String? halfStrKey;
  bool? injuredPlayerOut;
  List<Swap>? swap;

  MFEventsList({
    this.reactKey,
    this.type,
    this.time,
    this.overloadTime,
    this.eventId,
    this.player,
    this.homeScore,
    this.awayScore,
    this.profileUrl,
    this.isHome,
    this.nameStr,
    this.firstName,
    this.lastName,
    this.fullName,
    this.playerId,
    this.card,
    this.cardDescription,
    this.ownGoal,
    this.goalDescription,
    this.goalDescriptionKey,
    this.suffix,
    this.suffixKey,
    this.isPenaltyShootoutEvent,
    this.newScore,
    this.assistStr,
    this.assistProfileUrl,
    this.minutesAddedStr,
    this.minutesAddedKey,
    this.minutesAddedInput,
    this.halfStrShort,
    this.halfStrKey,
    this.injuredPlayerOut,
    this.swap,
  });

  MFEventsList.fromJson(Map<String, dynamic> json) {
    reactKey = json['reactKey'];
    type = json['type'];
    time = json['time'];
    overloadTime = json['overloadTime'];
    eventId = json['eventId'];
    player = json['player'] != null ? GoalPlayer.fromJson(json['player']) : null;
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];
    profileUrl = json['profileUrl'];
    isHome = json['isHome'];
    nameStr = json['nameStr'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    playerId = json['playerId'];
    card = json['card'];
    cardDescription = json['cardDescription'];
    ownGoal = json['ownGoal'];
    goalDescription = json['goalDescription'];
    goalDescriptionKey = json['goalDescriptionKey'];
    suffix = json['suffix'];
    suffixKey = json['suffixKey'];
    isPenaltyShootoutEvent = json['isPenaltyShootoutEvent'];
    newScore = json['newScore'] != null ? List<int>.from(json['newScore'].map((e) => int.parse(e.toString()))) : null;
    assistStr = json['assistStr'];
    assistProfileUrl = json['assistProfileUrl'];
    minutesAddedStr = json['minutesAddedStr'];
    minutesAddedKey = json['minutesAddedKey'];
    minutesAddedInput = json['minutesAddedInput'];
    halfStrShort = json['halfStrShort'];
    halfStrKey = json['halfStrKey'];
    injuredPlayerOut = json['injuredPlayerOut'];
    if (json['swap'] != null) {
      swap = <Swap>[];
      json['swap'].forEach((v) {
        swap!.add(Swap.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reactKey'] = reactKey;
    data['type'] = type;
    data['time'] = time;
    data['overloadTime'] = overloadTime;
    data['eventId'] = eventId;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;
    data['profileUrl'] = profileUrl;
    data['isHome'] = isHome;
    data['nameStr'] = nameStr;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['playerId'] = playerId;
    data['card'] = card;
    data['cardDescription'] = cardDescription;
    data['ownGoal'] = ownGoal;
    data['goalDescription'] = goalDescription;
    data['goalDescriptionKey'] = goalDescriptionKey;
    data['suffix'] = suffix;
    data['suffixKey'] = suffixKey;
    data['isPenaltyShootoutEvent'] = isPenaltyShootoutEvent;
    data['newScore'] = newScore;
    data['assistStr'] = assistStr;
    data['assistProfileUrl'] = assistProfileUrl;
    data['minutesAddedStr'] = minutesAddedStr;
    data['minutesAddedKey'] = minutesAddedKey;
    data['minutesAddedInput'] = minutesAddedInput;
    data['halfStrShort'] = halfStrShort;
    data['halfStrKey'] = halfStrKey;
    data['injuredPlayerOut'] = injuredPlayerOut;
    if (swap != null) {
      data['swap'] = swap!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Swap {
  String? name;
  String? id;
  String? profileUrl;

  Swap({this.name, this.id, this.profileUrl});

  Swap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['profileUrl'] = profileUrl;
    return data;
  }
}

class InfoBox {
  Null? legInfo;
  MatchDate? matchDate;
  Tournament? tournament;
  Stadium? stadium;
  Referee? referee;
  int? attendance;

  InfoBox({this.legInfo, this.matchDate, this.tournament, this.stadium, this.referee, this.attendance});

  InfoBox.fromJson(Map<String, dynamic> json) {
    legInfo = json['legInfo'];
    matchDate = json['Match Date'] != null ? new MatchDate.fromJson(json['Match Date']) : null;
    tournament = json['Tournament'] != null ? new Tournament.fromJson(json['Tournament']) : null;
    stadium = json['Stadium'] != null ? new Stadium.fromJson(json['Stadium']) : null;
    referee = json['Referee'] != null ? new Referee.fromJson(json['Referee']) : null;
    attendance = json['Attendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legInfo'] = legInfo;
    if (this.matchDate != null) {
      data['Match Date'] = matchDate!.toJson();
    }
    if (this.tournament != null) {
      data['Tournament'] = tournament!.toJson();
    }
    if (this.stadium != null) {
      data['Stadium'] = stadium!.toJson();
    }
    if (this.referee != null) {
      data['Referee'] = referee!.toJson();
    }
    data['Attendance'] = attendance;
    return data;
  }
}

class MatchDate {
  String? utcTime;
  bool? isDateCorrect;

  MatchDate({this.utcTime, this.isDateCorrect});

  MatchDate.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    isDateCorrect = json['isDateCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['utcTime'] = utcTime;
    data['isDateCorrect'] = isDateCorrect;
    return data;
  }
}

class Tournament {
  int? id;
  int? parentLeagueId;
  String? link;
  String? leagueName;
  String? roundName;
  String? round;

  Tournament({this.id, this.parentLeagueId, this.link, this.leagueName, this.roundName, this.round});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentLeagueId = json['parentLeagueId'];
    link = json['link'];
    leagueName = json['leagueName'];
    roundName = json['roundName'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parentLeagueId'] = parentLeagueId;
    data['link'] = link;
    data['leagueName'] = leagueName;
    data['roundName'] = roundName;
    data['round'] = round;
    return data;
  }
}

class Stadium {
  String? name;
  String? city;
  String? country;
  double? lat;
  double? long;
  int? capacity;
  String? surface;

  Stadium({this.name, this.city, this.country, this.lat, this.long, this.capacity, this.surface});

  Stadium.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
    capacity = json['capacity'];
    surface = json['surface'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['city'] = city;
    data['country'] = country;
    data['lat'] = lat;
    data['long'] = long;
    data['capacity'] = capacity;
    data['surface'] = surface;
    return data;
  }
}

class Referee {
  String? imgUrl;
  String? text;
  String? countryCode;
  String? country;

  Referee({this.imgUrl, this.text, this.countryCode, this.country});

  Referee.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    text = json['text'];
    countryCode = json['countryCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['text'] = text;
    data['countryCode'] = countryCode;
    data['country'] = country;
    return data;
  }
}

class MFTeamForm {
  int? result;
  String? resultString;
  String? imageUrl;
  String? linkToMatch;
  String? teamPageUrl;
  TooltipText? tooltipText;
  String? score;
  TeamFormTeam? home;
  TeamFormTeam? away;

  MFTeamForm({
    this.result,
    this.resultString,
    this.imageUrl,
    this.linkToMatch,
    this.teamPageUrl,
    this.tooltipText,
    this.score,
    this.home,
    this.away,
  });

  MFTeamForm.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    resultString = json['resultString'];
    imageUrl = json['imageUrl'];
    linkToMatch = json['linkToMatch'];
    teamPageUrl = json['teamPageUrl'];
    tooltipText = json['tooltipText'] != null ? TooltipText.fromJson(json['tooltipText']) : null;
    score = json['score'];
    home = json['home'] != null ? TeamFormTeam.fromJson(json['home']) : null;
    away = json['away'] != null ? TeamFormTeam.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['result'] = result;
    data['resultString'] = resultString;
    data['imageUrl'] = imageUrl;
    data['linkToMatch'] = linkToMatch;

    data['teamPageUrl'] = teamPageUrl;

    if (tooltipText != null) {
      data['tooltipText'] = tooltipText!.toJson();
    }

    data['score'] = score;

    if (home != null) {
      data['home'] = home!.toJson();
    }

    if (away != null) {
      data['away'] = away!.toJson();
    }

    return data;
  }
}

class TooltipText {
  String? utcTime;
  String? homeTeam;
  int? homeTeamId;
  String? homeScore;
  String? awayTeam;
  int? awayTeamId;
  String? awayScore;

  TooltipText({this.utcTime, this.homeTeam, this.homeTeamId, this.homeScore, this.awayTeam, this.awayTeamId, this.awayScore});

  TooltipText.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    homeTeam = json['homeTeam'];
    homeTeamId = json['homeTeamId'];
    homeScore = json['homeScore'];
    awayTeam = json['awayTeam'];
    awayTeamId = json['awayTeamId'];
    awayScore = json['awayScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['utcTime'] = utcTime;
    data['homeTeam'] = homeTeam;
    data['homeTeamId'] = homeTeamId;
    data['homeScore'] = homeScore;
    data['awayTeam'] = awayTeam;
    data['awayTeamId'] = awayTeamId;
    data['awayScore'] = awayScore;

    return data;
  }
}

class TeamFormTeam {
  String? id;
  String? name;
  bool? isOurTeam;

  TeamFormTeam({this.id, this.name, this.isOurTeam});

  TeamFormTeam.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name'];
    isOurTeam = json['isOurTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['isOurTeam'] = isOurTeam;

    return data;
  }
}

class TopPlayers {
  List<TopPlayer>? homeTopPlayers;
  List<TopPlayer>? awayTopPlayers;

  TopPlayers({this.homeTopPlayers, this.awayTopPlayers});

  TopPlayers.fromJson(Map<String, dynamic> json) {
    if (json['homeTopPlayers'] != null) {
      homeTopPlayers = <TopPlayer>[];
      json['homeTopPlayers'].forEach((v) {
        homeTopPlayers!.add(TopPlayer.fromJson(v));
      });
    }

    if (json['awayTopPlayers'] != null) {
      awayTopPlayers = <TopPlayer>[];
      json['awayTopPlayers'].forEach((v) {
        awayTopPlayers!.add(TopPlayer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (homeTopPlayers != null) {
      data['homeTopPlayers'] = homeTopPlayers!.map((v) => v.toJson()).toList();
    }

    if (awayTopPlayers != null) {
      data['awayTopPlayers'] = awayTopPlayers!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class TopPlayer {
  int? playerId;
  POMName? name;
  String? playerRatingRounded;
  double? playerRating;
  String? color;
  bool? manOfTheMatch;
  String? teamId;

  TopPlayer({this.playerId, this.name, this.playerRatingRounded, this.playerRating, this.color, this.manOfTheMatch, this.teamId});

  TopPlayer.fromJson(Map<String, dynamic> json) {
    playerId = json['playerId'];
    name = json['name'] != null ? POMName.fromJson(json['name']) : null;
    playerRatingRounded = json['playerRatingRounded'];
    playerRating = (json['playerRating'] as num?)?.toDouble();
    color = json['color'];
    manOfTheMatch = json['manOfTheMatch'];
    teamId = json['teamId']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['playerId'] = playerId;

    if (name != null) {
      data['name'] = name!.toJson();
    }

    data['playerRatingRounded'] = playerRatingRounded;
    data['playerRating'] = playerRating;
    data['color'] = color;
    data['manOfTheMatch'] = manOfTheMatch;
    data['teamId'] = teamId;
    return data;
  }
}

class Insights {
  String? type;
  dynamic playerId;
  int? teamId;
  int? priority;
  String? defaultText;
  String? localizedTextId;
  List<InsightStatValue>? statValues;
  String? text;
  String? color;

  Insights({
    this.type,
    this.playerId,
    this.teamId,
    this.priority,
    this.defaultText,
    this.localizedTextId,
    this.statValues,
    this.text,
    this.color,
  });

  Insights.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    playerId = json['playerId'];
    teamId = json['teamId'];
    priority = json['priority'];
    defaultText = json['defaultText'];
    localizedTextId = json['localizedTextId'];

    if (json['statValues'] != null) {
      statValues = <InsightStatValue>[];
      json['statValues'].forEach((v) {
        statValues!.add(InsightStatValue.fromJson(v));
      });
    }

    text = json['text'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['type'] = type;
    data['playerId'] = playerId;
    data['teamId'] = teamId;
    data['priority'] = priority;
    data['defaultText'] = defaultText;
    data['localizedTextId'] = localizedTextId;

    if (statValues != null) {
      data['statValues'] = statValues!.map((v) => v.toJson()).toList();
    }

    data['text'] = text;
    data['color'] = color;

    return data;
  }
}

class InsightStatValue {
  dynamic value;
  dynamic name;
  String? type;

  InsightStatValue({this.value, this.name, this.type});

  InsightStatValue.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['value'] = value;
    data['name'] = name;
    data['type'] = type;

    return data;
  }
}

class MatchStats {
  MatchPeriods? periods;

  MatchStats({this.periods});

  MatchStats.fromJson(Map<String, dynamic> json) {
    periods = json['Periods'] != null ? MatchPeriods.fromJson(json['Periods']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (periods != null) {
      data['Periods'] = periods!.toJson();
    }

    return data;
  }
}

class MatchPeriods {
  Map<String, MatchStatsPeriod>? data;

  MatchPeriods({this.data});

  MatchPeriods.fromJson(Map<String, dynamic> json) {
    data = {};

    json.forEach((key, value) {
      if (value != null && value is Map<String, dynamic>) {
        data![key] = MatchStatsPeriod.fromJson(value);
      }
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};

    if (data != null) {
      data!.forEach((key, value) {
        result[key] = value.toJson();
      });
    }

    return result;
  }
}

class MatchStatsPeriod {
  List<MatchStatsGroup>? stats;

  MatchStatsPeriod({this.stats});

  MatchStatsPeriod.fromJson(Map<String, dynamic> json) {
    if (json['stats'] != null) {
      stats = <MatchStatsGroup>[];
      json['stats'].forEach((v) {
        stats!.add(MatchStatsGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatchStatsGroup {
  String? title;
  String? key;
  List<MatchStatItem>? stats;

  MatchStatsGroup({this.title, this.key, this.stats});

  MatchStatsGroup.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];

    if (json['stats'] != null) {
      stats = <MatchStatItem>[];
      json['stats'].forEach((v) {
        stats!.add(MatchStatItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['title'] = title;
    data['key'] = key;

    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class MatchStatItem {
  String? title;
  String? key;
  List<dynamic>? stats;
  String? format;
  String? type;
  String? highlighted;

  MatchStatItem({this.title, this.key, this.stats, this.format, this.type, this.highlighted});

  MatchStatItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];

    if (json['stats'] != null) {
      stats = List<dynamic>.from(json['stats']);
    }

    format = json['format'];
    type = json['type'];
    highlighted = json['highlighted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['title'] = title;
    data['key'] = key;
    data['stats'] = stats;
    data['format'] = format;
    data['type'] = type;
    data['highlighted'] = highlighted;

    return data;
  }
}

class PlayerStatsData {
  String? name;
  int? id;
  String? optaId;
  int? teamId;
  String? teamName;
  bool? isGoalkeeper;
  List<PlayerStatGroup>? stats;
  List<ShotmapEvent>? shotmap;
  String? shirtNumber;
  int? positionId;
  int? usualPosition;

  PlayerStatsData({
    this.name,
    this.id,
    this.optaId,
    this.teamId,
    this.teamName,
    this.isGoalkeeper,
    this.stats,
    this.shotmap,
    this.shirtNumber,
    this.positionId,
    this.usualPosition,
  });

  PlayerStatsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    optaId = json['optaId']?.toString();
    teamId = json['teamId'];
    teamName = json['teamName'];
    isGoalkeeper = json['isGoalkeeper'];
    shirtNumber = json['shirtNumber']?.toString();
    positionId = json['positionId'];
    usualPosition = json['usualPosition'];

    if (json['stats'] != null) {
      stats = <PlayerStatGroup>[];
      json['stats'].forEach((v) {
        stats!.add(PlayerStatGroup.fromJson(v));
      });
    }

    if (json['shotmap'] != null) {
      shotmap = <ShotmapEvent>[];
      json['shotmap'].forEach((v) {
        shotmap!.add(ShotmapEvent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['id'] = id;
    data['optaId'] = optaId;
    data['teamId'] = teamId;
    data['teamName'] = teamName;
    data['isGoalkeeper'] = isGoalkeeper;

    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }

    if (shotmap != null) {
      data['shotmap'] = shotmap!.map((v) => v.toJson()).toList();
    }

    data['shirtNumber'] = shirtNumber;
    data['positionId'] = positionId;
    data['usualPosition'] = usualPosition;

    return data;
  }
}

class PlayerStatGroup {
  String? title;
  String? key;
  Map<String, PlayerStatItem>? stats;

  PlayerStatGroup({this.title, this.key, this.stats});

  PlayerStatGroup.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];

    if (json['stats'] != null) {
      stats = <String, PlayerStatItem>{};

      json['stats'].forEach((key, value) {
        stats![key.toString()] = PlayerStatItem.fromJson(value);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['title'] = title;
    data['key'] = key;

    if (stats != null) {
      data['stats'] = stats!.map((key, value) => MapEntry(key, value.toJson()));
    }

    return data;
  }
}

class PlayerStatItem {
  String? key;
  PlayerStatValue? stat;
  bool? hideInPopupCard;

  PlayerStatItem({this.key, this.stat, this.hideInPopupCard});

  PlayerStatItem.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    stat = json['stat'] != null ? PlayerStatValue.fromJson(json['stat']) : null;
    hideInPopupCard = json['hideInPopupCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['key'] = key;

    if (stat != null) {
      data['stat'] = stat!.toJson();
    }

    data['hideInPopupCard'] = hideInPopupCard;

    return data;
  }
}

class PlayerStatValue {
  dynamic value;
  dynamic total;
  String? type;

  PlayerStatValue({this.value, this.total, this.type});

  PlayerStatValue.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    total = json['total'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['value'] = value;
    data['total'] = total;
    data['type'] = type;

    return data;
  }
}

class Weather {
  int? temperature;
  int? windSpeed;
  String? windDirectionCardinal;
  int? iconCode;
  int? relativeHumidity;
  int? precipitation;
  int? snow;
  int? cloudCover;
  String? description;
  String? apiUsed;
  String? lastUpdated;
  String? localizedKey;
  String? defaultTitle;

  Weather({
    this.temperature,
    this.windSpeed,
    this.windDirectionCardinal,
    this.iconCode,
    this.relativeHumidity,
    this.precipitation,
    this.snow,
    this.cloudCover,
    this.description,
    this.apiUsed,
    this.lastUpdated,
    this.localizedKey,
    this.defaultTitle,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windSpeed = json['windSpeed'];
    windDirectionCardinal = json['windDirectionCardinal'];
    iconCode = json['iconCode'];
    relativeHumidity = json['relativeHumidity'];
    precipitation = json['precipitation'];
    snow = json['snow'];
    cloudCover = json['cloudCover'];
    description = json['description'];
    apiUsed = json['apiUsed'];
    lastUpdated = json['lastUpdated'];
    localizedKey = json['localizedKey'];
    defaultTitle = json['defaultTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['temperature'] = temperature;
    data['windSpeed'] = windSpeed;
    data['windDirectionCardinal'] = windDirectionCardinal;
    data['iconCode'] = iconCode;
    data['relativeHumidity'] = relativeHumidity;
    data['precipitation'] = precipitation;
    data['snow'] = snow;
    data['cloudCover'] = cloudCover;
    data['description'] = description;
    data['apiUsed'] = apiUsed;
    data['lastUpdated'] = lastUpdated;
    data['localizedKey'] = localizedKey;
    data['defaultTitle'] = defaultTitle;

    return data;
  }
}

class Lineup {
  int? matchId;
  String? lineupType;
  String? source;
  List<String>? availableFilters;
  LineupTeam? homeTeam;
  LineupTeam? awayTeam;

  Lineup({this.matchId, this.lineupType, this.source, this.availableFilters, this.homeTeam, this.awayTeam});

  Lineup.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    lineupType = json['lineupType'];
    source = json['source'];

    if (json['availableFilters'] != null) {
      availableFilters = List<String>.from(json['availableFilters']);
    }

    homeTeam = json['homeTeam'] != null ? LineupTeam.fromJson(json['homeTeam']) : null;

    awayTeam = json['awayTeam'] != null ? LineupTeam.fromJson(json['awayTeam']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['matchId'] = matchId;
    data['lineupType'] = lineupType;
    data['source'] = source;
    data['availableFilters'] = availableFilters;

    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }

    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }

    return data;
  }
}

class LineupTeam {
  int? id;
  String? name;
  double? rating;
  String? formation;
  List<LineupPlayer>? starters;
  LineupCoach? coach;
  List<LineupPlayer>? subs;
  double? averageStarterAge;
  int? totalStarterMarketValue;

  LineupTeam({
    this.id,
    this.name,
    this.rating,
    this.formation,
    this.starters,
    this.coach,
    this.subs,
    this.averageStarterAge,
    this.totalStarterMarketValue,
  });

  LineupTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = (json['rating'] as num?)?.toDouble();
    formation = json['formation'];

    if (json['starters'] != null) {
      starters = <LineupPlayer>[];
      json['starters'].forEach((v) {
        starters!.add(LineupPlayer.fromJson(v));
      });
    }

    coach = json['coach'] != null ? LineupCoach.fromJson(json['coach']) : null;

    if (json['subs'] != null) {
      subs = <LineupPlayer>[];
      json['subs'].forEach((v) {
        subs!.add(LineupPlayer.fromJson(v));
      });
    }

    averageStarterAge = (json['averageStarterAge'] as num?)?.toDouble();
    totalStarterMarketValue = json['totalStarterMarketValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['rating'] = rating;
    data['formation'] = formation;

    if (starters != null) {
      data['starters'] = starters!.map((v) => v.toJson()).toList();
    }

    if (coach != null) {
      data['coach'] = coach!.toJson();
    }

    if (subs != null) {
      data['subs'] = subs!.map((v) => v.toJson()).toList();
    }

    data['averageStarterAge'] = averageStarterAge;
    data['totalStarterMarketValue'] = totalStarterMarketValue;

    return data;
  }
}

class LineupPlayer {
  int? id;
  int? age;
  String? name;
  int? positionId;
  int? usualPlayingPositionId;
  String? shirtNumber;
  bool? isCaptain;
  String? countryName;
  String? countryCode;
  int? primaryTeamId;
  String? primaryTeamName;
  LineupLayout? horizontalLayout;
  LineupLayout? verticalLayout;
  int? marketValue;
  LineupPerformance? performance;
  String? firstName;
  String? lastName;
  dynamic rankings;

  LineupPlayer({
    this.id,
    this.age,
    this.name,
    this.positionId,
    this.usualPlayingPositionId,
    this.shirtNumber,
    this.isCaptain,
    this.countryName,
    this.countryCode,
    this.primaryTeamId,
    this.primaryTeamName,
    this.horizontalLayout,
    this.verticalLayout,
    this.marketValue,
    this.performance,
    this.firstName,
    this.lastName,
    this.rankings,
  });

  LineupPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    name = json['name'];
    positionId = json['positionId'];
    usualPlayingPositionId = json['usualPlayingPositionId'];
    shirtNumber = json['shirtNumber']?.toString();
    isCaptain = json['isCaptain'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    primaryTeamId = json['primaryTeamId'];
    primaryTeamName = json['primaryTeamName'];

    horizontalLayout = json['horizontalLayout'] != null ? LineupLayout.fromJson(json['horizontalLayout']) : null;

    verticalLayout = json['verticalLayout'] != null ? LineupLayout.fromJson(json['verticalLayout']) : null;

    marketValue = json['marketValue'];

    performance = json['performance'] != null ? LineupPerformance.fromJson(json['performance']) : null;

    firstName = json['firstName'];
    lastName = json['lastName'];
    rankings = json['rankings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['age'] = age;
    data['name'] = name;
    data['positionId'] = positionId;
    data['usualPlayingPositionId'] = usualPlayingPositionId;
    data['shirtNumber'] = shirtNumber;
    data['isCaptain'] = isCaptain;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['primaryTeamId'] = primaryTeamId;
    data['primaryTeamName'] = primaryTeamName;

    if (horizontalLayout != null) {
      data['horizontalLayout'] = horizontalLayout!.toJson();
    }

    if (verticalLayout != null) {
      data['verticalLayout'] = verticalLayout!.toJson();
    }

    data['marketValue'] = marketValue;

    if (performance != null) {
      data['performance'] = performance!.toJson();
    }

    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['rankings'] = rankings;

    return data;
  }
}

class LineupLayout {
  double? x;
  double? y;
  double? height;
  double? width;

  LineupLayout({this.x, this.y, this.height, this.width});

  LineupLayout.fromJson(Map<String, dynamic> json) {
    x = (json['x'] as num?)?.toDouble();
    y = (json['y'] as num?)?.toDouble();
    height = (json['height'] as num?)?.toDouble();
    width = (json['width'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['x'] = x;
    data['y'] = y;
    data['height'] = height;
    data['width'] = width;

    return data;
  }
}

class LineupPerformance {
  double? rating;
  List<LineupEvent>? events;
  List<LineupSubstitutionEvent>? substitutionEvents;
  bool? playerOfTheMatch;

  LineupPerformance({this.rating, this.events, this.substitutionEvents, this.playerOfTheMatch});

  LineupPerformance.fromJson(Map<String, dynamic> json) {
    rating = (json['rating'] as num?)?.toDouble();

    if (json['events'] != null) {
      events = <LineupEvent>[];
      json['events'].forEach((v) {
        events!.add(LineupEvent.fromJson(v));
      });
    }

    if (json['substitutionEvents'] != null) {
      substitutionEvents = <LineupSubstitutionEvent>[];
      json['substitutionEvents'].forEach((v) {
        substitutionEvents!.add(LineupSubstitutionEvent.fromJson(v));
      });
    }

    playerOfTheMatch = json['playerOfTheMatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['rating'] = rating;

    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }

    if (substitutionEvents != null) {
      data['substitutionEvents'] = substitutionEvents!.map((v) => v.toJson()).toList();
    }

    data['playerOfTheMatch'] = playerOfTheMatch;

    return data;
  }
}

class LineupEvent {
  String? type;

  LineupEvent({this.type});

  LineupEvent.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    return data;
  }
}

class LineupSubstitutionEvent {
  int? time;
  String? type;
  String? reason;

  LineupSubstitutionEvent({this.time, this.type, this.reason});

  LineupSubstitutionEvent.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    type = json['type'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['time'] = time;
    data['type'] = type;
    data['reason'] = reason;

    return data;
  }
}

class LineupCoach {
  int? id;
  int? age;
  String? name;
  String? countryName;
  String? countryCode;
  String? firstName;
  String? lastName;
  int? primaryTeamId;
  String? primaryTeamName;
  dynamic usualPlayingPositionId;
  bool? isCoach;

  LineupCoach({
    this.id,
    this.age,
    this.name,
    this.countryName,
    this.countryCode,
    this.firstName,
    this.lastName,
    this.primaryTeamId,
    this.primaryTeamName,
    this.usualPlayingPositionId,
    this.isCoach,
  });

  LineupCoach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    name = json['name'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    primaryTeamId = json['primaryTeamId'];
    primaryTeamName = json['primaryTeamName'];
    usualPlayingPositionId = json['usualPlayingPositionId'];
    isCoach = json['isCoach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['age'] = age;
    data['name'] = name;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['primaryTeamId'] = primaryTeamId;
    data['primaryTeamName'] = primaryTeamName;
    data['usualPlayingPositionId'] = usualPlayingPositionId;
    data['isCoach'] = isCoach;

    return data;
  }
}

class MatchTable {
  String? leagueId;
  String? url;
  List<int>? teams;
  String? tournamentNameForUrl;
  int? parentLeagueId;
  String? countryCode;

  MatchTable({this.leagueId, this.url, this.teams, this.tournamentNameForUrl, this.parentLeagueId, this.countryCode});

  MatchTable.fromJson(Map<String, dynamic> json) {
    leagueId = json['leagueId']?.toString();
    url = json['url'];

    if (json['teams'] != null) {
      teams = List<int>.from(json['teams']);
    }

    tournamentNameForUrl = json['tournamentNameForUrl'];
    parentLeagueId = json['parentLeagueId'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['leagueId'] = leagueId;
    data['url'] = url;
    data['teams'] = teams;
    data['tournamentNameForUrl'] = tournamentNameForUrl;
    data['parentLeagueId'] = parentLeagueId;
    data['countryCode'] = countryCode;

    return data;
  }
}

class H2h {
  List<int>? summary;
  List<H2hMatch>? matches;

  H2h({this.summary, this.matches});

  H2h.fromJson(Map<String, dynamic> json) {
    if (json['summary'] != null) {
      summary = List<int>.from(json['summary']);
    }

    if (json['matches'] != null) {
      matches = <H2hMatch>[];
      json['matches'].forEach((v) {
        matches!.add(H2hMatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['summary'] = summary;

    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class H2hMatch {
  H2hTime? time;
  String? matchUrl;
  H2hLeague? league;
  H2hTeam? home;
  H2hStatus? status;
  bool? finished;
  H2hTeam? away;

  H2hMatch({this.time, this.matchUrl, this.league, this.home, this.status, this.finished, this.away});

  H2hMatch.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? H2hTime.fromJson(json['time']) : null;
    matchUrl = json['matchUrl'];
    league = json['league'] != null ? H2hLeague.fromJson(json['league']) : null;
    home = json['home'] != null ? H2hTeam.fromJson(json['home']) : null;
    status = json['status'] != null ? H2hStatus.fromJson(json['status']) : null;
    finished = json['finished'];
    away = json['away'] != null ? H2hTeam.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (time != null) {
      data['time'] = time!.toJson();
    }

    data['matchUrl'] = matchUrl;

    if (league != null) {
      data['league'] = league!.toJson();
    }

    if (home != null) {
      data['home'] = home!.toJson();
    }

    if (status != null) {
      data['status'] = status!.toJson();
    }

    data['finished'] = finished;

    if (away != null) {
      data['away'] = away!.toJson();
    }

    return data;
  }
}

class H2hTime {
  String? utcTime;

  H2hTime({this.utcTime});

  H2hTime.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['utcTime'] = utcTime;
    return data;
  }
}

class H2hLeague {
  String? name;
  String? id;
  String? pageUrl;

  H2hLeague({this.name, this.id, this.pageUrl});

  H2hLeague.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id']?.toString();
    pageUrl = json['pageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['id'] = id;
    data['pageUrl'] = pageUrl;

    return data;
  }
}

class H2hTeam {
  String? name;
  String? id;

  H2hTeam({this.name, this.id});

  H2hTeam.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['id'] = id;

    return data;
  }
}

class H2hStatus {
  String? utcTime;
  bool? finished;
  bool? started;
  bool? cancelled;
  bool? awarded;
  String? scoreStr;
  H2hReason? reason;

  H2hStatus({this.utcTime, this.finished, this.started, this.cancelled, this.awarded, this.scoreStr, this.reason});

  H2hStatus.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    finished = json['finished'];
    started = json['started'];
    cancelled = json['cancelled'];
    awarded = json['awarded'];
    scoreStr = json['scoreStr'];
    reason = json['reason'] != null ? H2hReason.fromJson(json['reason']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['utcTime'] = utcTime;
    data['finished'] = finished;
    data['started'] = started;
    data['cancelled'] = cancelled;
    data['awarded'] = awarded;
    data['scoreStr'] = scoreStr;

    if (reason != null) {
      data['reason'] = reason!.toJson();
    }

    return data;
  }
}

class H2hReason {
  String? short;
  String? shortKey;
  String? long;
  String? longKey;

  H2hReason({this.short, this.shortKey, this.long, this.longKey});

  H2hReason.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    shortKey = json['shortKey'];
    long = json['long'];
    longKey = json['longKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['short'] = short;
    data['shortKey'] = shortKey;
    data['long'] = long;
    data['longKey'] = longKey;

    return data;
  }
}
