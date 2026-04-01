class MatchesModel {
  List<Leagues>? leagues;
  String? date;

  MatchesModel({this.leagues, this.date});

  MatchesModel.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues!.add(Leagues.fromJson(v));
      });
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['leagues'] = this.leagues!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    return data;
  }
}

class Leagues {
  String? ccode;
  int? id;
  int? primaryId;
  String? name;
  List<Matches>? matches;
  int? parentLeagueId;
  int? internalRank;
  int? liveRank;
  bool? simpleLeague;
  int? localRank;
  bool? isGroup;
  String? groupName;
  String? parentLeagueName;

  Leagues(
      {this.ccode,
        this.id,
        this.primaryId,
        this.name,
        this.matches,
        this.parentLeagueId,
        this.internalRank,
        this.liveRank,
        this.simpleLeague,
        this.localRank,
        this.isGroup,
        this.groupName,
        this.parentLeagueName});

  Leagues.fromJson(Map<String, dynamic> json) {
    ccode = json['ccode'];
    id = json['id'];
    primaryId = json['primaryId'];
    name = json['name'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
    parentLeagueId = json['parentLeagueId'];
    internalRank = json['internalRank'];
    liveRank = json['liveRank'];
    simpleLeague = json['simpleLeague'];
    localRank = json['localRank'];
    isGroup = json['isGroup'];
    groupName = json['groupName'];
    parentLeagueName = json['parentLeagueName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ccode'] = this.ccode;
    data['id'] = this.id;
    data['primaryId'] = this.primaryId;
    data['name'] = this.name;
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    data['parentLeagueId'] = this.parentLeagueId;
    data['internalRank'] = this.internalRank;
    data['liveRank'] = this.liveRank;
    data['simpleLeague'] = this.simpleLeague;
    data['localRank'] = this.localRank;
    data['isGroup'] = this.isGroup;
    data['groupName'] = this.groupName;
    data['parentLeagueName'] = this.parentLeagueName;
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

  Matches(
      {this.id,
        this.leagueId,
        this.time,
        this.home,
        this.away,
        this.eliminatedTeamId,
        this.statusId,
        this.tournamentStage,
        this.status,
        this.timeTS});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['leagueId'];
    time = json['time'];
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    away = json['away'] != null ? new Home.fromJson(json['away']) : null;
    eliminatedTeamId = json['eliminatedTeamId'];
    statusId = json['statusId'];
    tournamentStage = json['tournamentStage'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    timeTS = json['timeTS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['leagueId'] = this.leagueId;
    data['time'] = this.time;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    data['eliminatedTeamId'] = this.eliminatedTeamId;
    data['statusId'] = this.statusId;
    data['tournamentStage'] = this.tournamentStage;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['timeTS'] = this.timeTS;
    return data;
  }
}

class Home {
  int? id;
  int? score;
  String? name;
  String? longName;
  int? redCards;
  int? penScore;

  Home(
      {this.id,
        this.score,
        this.name,
        this.longName,
        this.redCards,
        this.penScore});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    name = json['name'];
    longName = json['longName'];
    redCards = json['redCards'];
    penScore = json['penScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['score'] = this.score;
    data['name'] = this.name;
    data['longName'] = this.longName;
    data['redCards'] = this.redCards;
    data['penScore'] = this.penScore;
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
  int? numberOfHomeRedCards;
  String? aggregatedStr;
  bool? ongoing;
  LiveTime? liveTime;
  int? numberOfAwayRedCards;

  Status(
      {this.utcTime,
        this.halfs,
        this.periodLength,
        this.finished,
        this.started,
        this.cancelled,
        this.awarded,
        this.scoreStr,
        this.reason,
        this.numberOfHomeRedCards,
        this.aggregatedStr,
        this.ongoing,
        this.liveTime,
        this.numberOfAwayRedCards});

  Status.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    halfs = json['halfs'] != null ? new Halfs.fromJson(json['halfs']) : null;
    periodLength = json['periodLength'];
    finished = json['finished'];
    started = json['started'];
    cancelled = json['cancelled'];
    awarded = json['awarded'];
    scoreStr = json['scoreStr'];
    reason =
    json['reason'] != null ? new Reason.fromJson(json['reason']) : null;
    numberOfHomeRedCards = json['numberOfHomeRedCards'];
    aggregatedStr = json['aggregatedStr'];
    ongoing = json['ongoing'];
    liveTime = json['liveTime'] != null
        ? new LiveTime.fromJson(json['liveTime'])
        : null;
    numberOfAwayRedCards = json['numberOfAwayRedCards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['utcTime'] = this.utcTime;
    if (this.halfs != null) {
      data['halfs'] = this.halfs!.toJson();
    }
    data['periodLength'] = this.periodLength;
    data['finished'] = this.finished;
    data['started'] = this.started;
    data['cancelled'] = this.cancelled;
    data['awarded'] = this.awarded;
    data['scoreStr'] = this.scoreStr;
    if (this.reason != null) {
      data['reason'] = this.reason!.toJson();
    }
    data['numberOfHomeRedCards'] = this.numberOfHomeRedCards;
    data['aggregatedStr'] = this.aggregatedStr;
    data['ongoing'] = this.ongoing;
    if (this.liveTime != null) {
      data['liveTime'] = this.liveTime!.toJson();
    }
    data['numberOfAwayRedCards'] = this.numberOfAwayRedCards;
    return data;
  }
}

class Halfs {
  String? firstHalfStarted;
  String? secondHalfStarted;

  Halfs({this.firstHalfStarted, this.secondHalfStarted});

  Halfs.fromJson(Map<String, dynamic> json) {
    firstHalfStarted = json['firstHalfStarted'];
    secondHalfStarted = json['secondHalfStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstHalfStarted'] = this.firstHalfStarted;
    data['secondHalfStarted'] = this.secondHalfStarted;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['shortKey'] = this.shortKey;
    data['long'] = this.long;
    data['longKey'] = this.longKey;
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

  LiveTime(
      {this.short,
        this.shortKey,
        this.long,
        this.longKey,
        this.maxTime,
        this.basePeriod,
        this.addedTime});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['shortKey'] = this.shortKey;
    data['long'] = this.long;
    data['longKey'] = this.longKey;
    data['maxTime'] = this.maxTime;
    data['basePeriod'] = this.basePeriod;
    data['addedTime'] = this.addedTime;
    return data;
  }
}
