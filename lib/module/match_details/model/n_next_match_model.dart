class NewNextMatchModel {
  int? matchId;
  int? homeId;
  int? awayId;
  String? homeName;
  String? awayName;
  String? matchDate;
  int? statusId;
  int? leagueId;
  int? parentLeagueId;
  String? leagueName;
  Status? status;
  Stadium? stadium;
  String? matchUrl;

  NewNextMatchModel({
    this.matchId,
    this.homeId,
    this.awayId,
    this.homeName,
    this.awayName,
    this.matchDate,
    this.statusId,
    this.leagueId,
    this.parentLeagueId,
    this.leagueName,
    this.status,
    this.stadium,
    this.matchUrl,
  });

  NewNextMatchModel.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    homeId = json['homeId'];
    awayId = json['awayId'];
    homeName = json['homeName'];
    awayName = json['awayName'];
    matchDate = json['matchDate'];
    statusId = json['statusId'];
    leagueId = json['leagueId'];
    parentLeagueId = json['parentLeagueId'];
    leagueName = json['leagueName'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    stadium = json['stadium'] != null ? Stadium.fromJson(json['stadium']) : null;
    matchUrl = json['matchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['homeId'] = homeId;
    data['awayId'] = awayId;
    data['homeName'] = homeName;
    data['awayName'] = awayName;
    data['matchDate'] = matchDate;
    data['statusId'] = statusId;
    data['leagueId'] = leagueId;
    data['parentLeagueId'] = parentLeagueId;
    data['leagueName'] = leagueName;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (stadium != null) {
      data['stadium'] = stadium!.toJson();
    }
    data['matchUrl'] = matchUrl;
    return data;
  }
}

class Status {
  String? utcTime;
  bool? started;
  bool? cancelled;
  bool? finished;

  Status({this.utcTime, this.started, this.cancelled, this.finished});

  Status.fromJson(Map<String, dynamic> json) {
    utcTime = json['utcTime'];
    started = json['started'];
    cancelled = json['cancelled'];
    finished = json['finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['utcTime'] = utcTime;
    data['started'] = started;
    data['cancelled'] = cancelled;
    data['finished'] = finished;
    return data;
  }
}

class Stadium {
  String? venue;
  String? city;
  double? lat;
  double? long;

  Stadium({this.venue, this.city, this.lat, this.long});

  Stadium.fromJson(Map<String, dynamic> json) {
    venue = json['venue'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['venue'] = venue;
    data['city'] = city;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
