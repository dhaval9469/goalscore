class MatchLineUpModel {
  int? code;
  LineupData? data;
  String? message;

  MatchLineUpModel({this.code, this.data, this.message});

  MatchLineUpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new LineupData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class LineupData {
  int? provider;
  int? type;
  bool? confirmed;
  TeamLineup? home;
  TeamLineup? away;

  LineupData({this.provider, this.type, this.confirmed, this.home, this.away});

  LineupData.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    type = json['type'];
    confirmed = json['confirmed'];
    home = json['home'] != null ? new TeamLineup.fromJson(json['home']) : null;
    away = json['away'] != null ? new TeamLineup.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider'] = this.provider;
    data['type'] = this.type;
    data['confirmed'] = this.confirmed;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    return data;
  }
}

class TeamLineup {
  bool? isNationalTeam;
  String? formation;
  List<Players>? players;
  List<MissingPlayers>? missingPlayers;
  Coach? coach;

  TeamLineup({this.isNationalTeam, this.formation, this.players, this.missingPlayers, this.coach});

  TeamLineup.fromJson(Map<String, dynamic> json) {
    isNationalTeam = json['isNationalTeam'];
    formation = json['formation'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
    if (json['missingPlayers'] != null) {
      missingPlayers = <MissingPlayers>[];
      json['missingPlayers'].forEach((v) {
        missingPlayers!.add(new MissingPlayers.fromJson(v));
      });
    }
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isNationalTeam'] = this.isNationalTeam;
    data['formation'] = this.formation;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    if (this.missingPlayers != null) {
      data['missingPlayers'] = this.missingPlayers!.map((v) => v.toJson()).toList();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    return data;
  }
}

class Players {
  PlayerInfo? player;
  int? shirtNumber;
  int? jerseyNumber;
  String? position;
  bool? substitute;
  bool? captain;
  String? rating;
  int? counterOrder;

  Players({
    this.player,
    this.shirtNumber,
    this.jerseyNumber,
    this.position,
    this.substitute,
    this.captain,
    this.rating,
    this.counterOrder,
  });

  Players.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new PlayerInfo.fromJson(json['player']) : null;
    shirtNumber = json['shirtNumber'];
    jerseyNumber = json['jerseyNumber'];
    position = json['position'];
    substitute = json['substitute'];
    captain = json['captain'];
    rating = json['rating'];
    counterOrder = json['counterOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['shirtNumber'] = this.shirtNumber;
    data['jerseyNumber'] = this.jerseyNumber;
    data['position'] = this.position;
    data['substitute'] = this.substitute;
    data['captain'] = this.captain;
    data['rating'] = this.rating;
    data['counterOrder'] = this.counterOrder;
    return data;
  }
}

class PlayerInfo {
  String? id;
  String? name;
  String? fullName;
  String? slug;
  String? position;
  int? order;
  Coutry? coutry;
  int? birthday;
  String? marketValue;
  int? height;
  Coutry? team;

  PlayerInfo({
    this.id,
    this.name,
    this.fullName,
    this.slug,
    this.position,
    this.order,
    this.coutry,
    this.birthday,
    this.marketValue,
    this.height,
    this.team,
  });

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['fullName'];
    slug = json['slug'];
    position = json['position'];
    order = json['order'];
    coutry = json['coutry'] != null ? new Coutry.fromJson(json['coutry']) : null;
    birthday = json['birthday'];
    marketValue = json['market_value'];
    height = json['height'];
    team = json['team'] != null ? new Coutry.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['slug'] = this.slug;
    data['position'] = this.position;
    data['order'] = this.order;
    if (this.coutry != null) {
      data['coutry'] = this.coutry!.toJson();
    }
    data['birthday'] = this.birthday;
    data['market_value'] = this.marketValue;
    data['height'] = this.height;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    return data;
  }
}

class Coutry {
  String? id;
  String? name;

  Coutry({this.id, this.name});

  Coutry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class MissingPlayers {
  MPlayerInfo? player;
  String? type;
  String? typeTranslate;
  int? reason;

  MissingPlayers({this.player, this.type, this.typeTranslate, this.reason});

  MissingPlayers.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new MPlayerInfo.fromJson(json['player']) : null;
    type = json['type'];
    typeTranslate = json['typeTranslate'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['type'] = this.type;
    data['typeTranslate'] = this.typeTranslate;
    data['reason'] = this.reason;
    return data;
  }
}

class MPlayerInfo {
  String? id;
  String? name;
  String? fullName;
  String? slug;
  String? position;
  Coutry? coutry;
  Coutry? team;
  int? birthday;
  String? marketValue;
  int? height;

  MPlayerInfo({
    this.id,
    this.name,
    this.fullName,
    this.slug,
    this.position,
    this.coutry,
    this.team,
    this.birthday,
    this.marketValue,
    this.height,
  });

  MPlayerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['fullName'];
    slug = json['slug'];
    position = json['position'];
    coutry = json['coutry'] != null ? new Coutry.fromJson(json['coutry']) : null;
    team = json['team'] != null ? new Coutry.fromJson(json['team']) : null;
    birthday = json['birthday'];
    marketValue = json['market_value'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['slug'] = this.slug;
    data['position'] = this.position;
    if (this.coutry != null) {
      data['coutry'] = this.coutry!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['birthday'] = this.birthday;
    data['market_value'] = this.marketValue;
    data['height'] = this.height;
    return data;
  }
}

class Coach {
  String? id;
  String? name;
  bool? hasMapping;

  Coach({this.id, this.name, this.hasMapping});

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hasMapping = json['hasMapping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hasMapping'] = this.hasMapping;
    return data;
  }
}


