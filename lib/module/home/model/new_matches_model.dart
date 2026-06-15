class NewMatchesModel {
  List<Leagues>? leagues;
  String? date;

  NewMatchesModel({this.leagues, this.date});

  NewMatchesModel.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues!.add(Leagues.fromJson(v));
      });
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leagues != null) {
      data['leagues'] = leagues!.map((v) => v.toJson()).toList();
    }
    data['date'] = date;
    return data;
  }
}

class Leagues {
  bool? isGroup;
  String? groupName;
  String? ccode;
  int? id;
  int? primaryId;
  String? name;
  List<Matches>? matches;
  int? parentLeagueId;
  String? parentLeagueName;
  int? internalRank;
  int? liveRank;
  bool? simpleLeague;
  int? localRank;
  int? nextDayGroupOrder;

  Leagues({
    this.isGroup,
    this.groupName,
    this.ccode,
    this.id,
    this.primaryId,
    this.name,
    this.matches,
    this.parentLeagueId,
    this.parentLeagueName,
    this.internalRank,
    this.liveRank,
    this.simpleLeague,
    this.localRank,
    this.nextDayGroupOrder,
  });

  Leagues.fromJson(Map<String, dynamic> json) {
    isGroup = json['isGroup'];
    groupName = json['groupName'];
    ccode = json['ccode'];
    id = json['id'];
    primaryId = json['primaryId'];
    name = json['name'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
    parentLeagueId = json['parentLeagueId'];
    parentLeagueName = json['parentLeagueName'];
    internalRank = json['internalRank'];
    liveRank = json['liveRank'];
    simpleLeague = json['simpleLeague'];
    localRank = json['localRank'];
    nextDayGroupOrder = json['nextDayGroupOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isGroup'] = isGroup;
    data['groupName'] = groupName;
    data['ccode'] = ccode;
    data['id'] = id;
    data['primaryId'] = primaryId;
    data['name'] = name;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    data['parentLeagueId'] = parentLeagueId;
    data['parentLeagueName'] = parentLeagueName;
    data['internalRank'] = internalRank;
    data['liveRank'] = liveRank;
    data['simpleLeague'] = simpleLeague;
    data['localRank'] = localRank;
    data['nextDayGroupOrder'] = nextDayGroupOrder;
    return data;
  }
}

class Matches {
  int? id;
  int? leagueId;
  String? time;
  Home? home;
  Home? away;
  int? eliminatedTeamId;
  int? statusId;
  String? tournamentStage;
  Status? status;
  int? timeTS;
  bool? isNextDay;

  Matches({
    this.id,
    this.leagueId,
    this.time,
    this.home,
    this.away,
    this.eliminatedTeamId,
    this.statusId,
    this.tournamentStage,
    this.status,
    this.timeTS,
    this.isNextDay,
  });

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['leagueId'];
    time = json['time'];
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    away = json['away'] != null ? Home.fromJson(json['away']) : null;
    eliminatedTeamId = json['eliminatedTeamId'];
    statusId = json['statusId'];
    tournamentStage = json['tournamentStage'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    timeTS = json['timeTS'];
    isNextDay = json['isNextDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['leagueId'] = leagueId;
    data['time'] = time;
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (away != null) {
      data['away'] = away!.toJson();
    }
    data['eliminatedTeamId'] = eliminatedTeamId;
    data['statusId'] = statusId;
    data['tournamentStage'] = tournamentStage;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['timeTS'] = timeTS;
    data['isNextDay'] = isNextDay;
    return data;
  }
}

class Home {
  int? id;
  int? score;
  String? name;
  String? longName;
  int? redCards;

  Home({this.id, this.score, this.name, this.longName, this.redCards});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    name = json['name'];
    longName = json['longName'];
    redCards = json['redCards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['score'] = score;
    data['name'] = name;
    data['longName'] = longName;
    data['redCards'] = redCards;
    return data;
  }
}

class Status {
  String? utcTime;
  Halfs? halfs;
  int? periodLength;
  bool? finished;
  bool? started;
  bool? cancelled;
  bool? awarded;
  String? scoreStr;
  Reason? reason;
  int? numberOfAwayRedCards;
  bool? ongoing;
  LiveTime? liveTime;
  int? numberOfHomeRedCards;
  String? aggregatedStr;

  Status({
    this.utcTime,
    this.halfs,
    this.periodLength,
    this.finished,
    this.started,
    this.cancelled,
    this.awarded,
    this.scoreStr,
    this.reason,
    this.numberOfAwayRedCards,
    this.ongoing,
    this.liveTime,
    this.numberOfHomeRedCards,
    this.aggregatedStr,
  });

  Status.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    halfs = json['halfs'] != null ? Halfs.fromJson(json['halfs']) : null;
    periodLength = json['periodLength'];
    finished = json['finished'];
    started = json['started'];
    cancelled = json['cancelled'];
    awarded = json['awarded'];
    scoreStr = json['scoreStr'];
    reason = json['reason'] != null ? Reason.fromJson(json['reason']) : null;
    numberOfAwayRedCards = json['numberOfAwayRedCards'];
    ongoing = json['ongoing'];
    liveTime = json['liveTime'] != null ? LiveTime.fromJson(json['liveTime']) : null;
    numberOfHomeRedCards = json['numberOfHomeRedCards'];
    aggregatedStr = json['aggregatedStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['utcTime'] = utcTime;
    if (halfs != null) {
      data['halfs'] = halfs!.toJson();
    }
    data['periodLength'] = periodLength;
    data['finished'] = finished;
    data['started'] = started;
    data['cancelled'] = cancelled;
    data['awarded'] = awarded;
    data['scoreStr'] = scoreStr;
    if (reason != null) {
      data['reason'] = reason!.toJson();
    }
    data['numberOfAwayRedCards'] = numberOfAwayRedCards;
    data['ongoing'] = ongoing;
    if (liveTime != null) {
      data['liveTime'] = liveTime!.toJson();
    }
    data['numberOfHomeRedCards'] = numberOfHomeRedCards;
    data['aggregatedStr'] = aggregatedStr;
    return data;
  }
}

class Halfs {
  String? firstHalfStarted;
  String? secondHalfStarted;
  String? firstExtraHalfStarted;
  String? secondExtraHalfStarted;

  Halfs({this.firstHalfStarted, this.secondHalfStarted, this.firstExtraHalfStarted, this.secondExtraHalfStarted});

  Halfs.fromJson(Map<String, dynamic> json) {
    firstHalfStarted = json['firstHalfStarted'];
    secondHalfStarted = json['secondHalfStarted'];
    firstExtraHalfStarted = json['firstExtraHalfStarted'];
    secondExtraHalfStarted = json['secondExtraHalfStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data =  <String, dynamic>{};
    data['firstHalfStarted'] = firstHalfStarted;
    data['secondHalfStarted'] = secondHalfStarted;
    data['firstExtraHalfStarted'] = firstExtraHalfStarted;
    data['secondExtraHalfStarted'] = secondExtraHalfStarted;
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

class LiveTime {
  String? short;
  String? shortKey;
  String? long;
  String? longKey;
  int? maxTime;
  int? basePeriod;
  int? addedTime;

  LiveTime({this.short, this.shortKey, this.long, this.longKey, this.maxTime, this.basePeriod, this.addedTime});

  LiveTime.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    shortKey = json['shortKey'];
    long = json['long'];
    longKey = json['longKey'];
    maxTime = json['maxTime'];
    basePeriod = json['basePeriod'];
    addedTime = json['addedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short'] = short;
    data['shortKey'] = shortKey;
    data['long'] = long;
    data['longKey'] = longKey;
    data['maxTime'] = maxTime;
    data['basePeriod'] = basePeriod;
    data['addedTime'] = addedTime;
    return data;
  }
}
