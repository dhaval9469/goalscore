class MatchIncidentModel {
  int? code;
  int? errorCode;
  String? message;
  IncidentData? data;

  MatchIncidentModel({this.code, this.errorCode, this.message, this.data});

  MatchIncidentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? IncidentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['error_code'] = errorCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class IncidentData {
  List<Incidents>? incidents;
  List<Corners>? corners;
  List<Cards>? cards;
  List<Goals>? goals;
  bool? shouldFallbackGoal;
  bool? shouldFallbackCard;
  bool? hasEvent;
  int? fromProvider;

  IncidentData({
    this.incidents,
    this.corners,
    this.cards,
    this.goals,
    this.shouldFallbackGoal,
    this.shouldFallbackCard,
    this.hasEvent,
    this.fromProvider,
  });

  IncidentData.fromJson(Map<String, dynamic> json) {
    if (json['incidents'] != null) {
      incidents = <Incidents>[];
      json['incidents'].forEach((v) {
        incidents!.add(Incidents.fromJson(v));
      });
    }
    if (json['corners'] != null) {
      corners = <Corners>[];
      json['corners'].forEach((v) {
        corners!.add(Corners.fromJson(v));
      });
    }
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(Goals.fromJson(v));
      });
    }
    shouldFallbackGoal = json['shouldFallbackGoal'];
    shouldFallbackCard = json['shouldFallbackCard'];
    hasEvent = json['has_event'];
    fromProvider = json['from_provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.incidents != null) {
      data['incidents'] = incidents!.map((v) => v.toJson()).toList();
    }
    if (this.corners != null) {
      data['corners'] = corners!.map((v) => v.toJson()).toList();
    }
    if (this.cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    if (this.goals != null) {
      data['goals'] = goals!.map((v) => v.toJson()).toList();
    }
    data['shouldFallbackGoal'] = shouldFallbackGoal;
    data['shouldFallbackCard'] = shouldFallbackCard;
    data['has_event'] = hasEvent;
    data['from_provider'] = fromProvider;
    return data;
  }
}

class Incidents {
  String? text;
  int? period;
  int? time;
  int? timeSec;
  String? incidentType;
  int? homeScore;
  int? awayScore;
  bool? isHome;
  int? addedTime;
  String? incidentClass;
  String? cardReason;
  Player? player;
  Player? assist1;
  List<GoalSimulation>? goalSimulation;
  int? length;
  String? subReason;
  Player? playerIn;
  Player? playerOut;

  Incidents({
    this.text,
    this.period,
    this.time,
    this.timeSec,
    this.incidentType,
    this.homeScore,
    this.awayScore,
    this.isHome,
    this.addedTime,
    this.incidentClass,
    this.cardReason,
    this.player,
    this.assist1,
    this.goalSimulation,
    this.length,
    this.subReason,
    this.playerIn,
    this.playerOut,
  });

  Incidents.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    period = json['period'];
    time = json['time'];
    timeSec = json['timeSec'];
    incidentType = json['incidentType'];
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];
    isHome = json['isHome'];
    addedTime = json['addedTime'];
    incidentClass = json['incidentClass'];
    cardReason = json['cardReason'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    assist1 = json['assist1'] != null ? Player.fromJson(json['assist1']) : null;
    if (json['goalSimulation'] != null) {
      goalSimulation = <GoalSimulation>[];
      json['goalSimulation'].forEach((v) {
        goalSimulation!.add(GoalSimulation.fromJson(v));
      });
    }
    length = json['length'];
    subReason = json['subReason'];
    playerIn = json['playerIn'] != null ? Player.fromJson(json['playerIn']) : null;
    playerOut = json['playerOut'] != null ? Player.fromJson(json['playerOut']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['period'] = period;
    data['time'] = time;
    data['timeSec'] = timeSec;
    data['incidentType'] = incidentType;
    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;
    data['isHome'] = isHome;
    data['addedTime'] = addedTime;
    data['incidentClass'] = incidentClass;
    data['cardReason'] = cardReason;
    if (this.player != null) {
      data['player'] = player!.toJson();
    }
    if (this.assist1 != null) {
      data['assist1'] = assist1!.toJson();
    }
    if (this.goalSimulation != null) {
      data['goalSimulation'] = goalSimulation!.map((v) => v.toJson()).toList();
    }
    data['length'] = length;
    data['subReason'] = subReason;
    if (this.playerIn != null) {
      data['playerIn'] = playerIn!.toJson();
    }
    if (this.playerOut != null) {
      data['playerOut'] = playerOut!.toJson();
    }
    return data;
  }
}

class Player {
  String? id;
  String? name;
  String? slug;

  Player({this.id, this.name, this.slug});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class GoalSimulation {
  GSPlayer? player;
  String? eventType;
  int? time;
  bool? isHome;
  bool? isAssist;
  PlayerCoordinates? playerCoordinates;
  PlayerCoordinates? passEndCoordinates;
  String? bodyPart;
  String? goalType;
  PlayerCoordinates? gkCoordinates;
  PlayerCoordinates? goalShotCoordinates;
  PlayerCoordinates? goalMouthCoordinates;
  Player? goalkeeper;

  GoalSimulation({
    this.player,
    this.eventType,
    this.time,
    this.isHome,
    this.isAssist,
    this.playerCoordinates,
    this.passEndCoordinates,
    this.bodyPart,
    this.goalType,
    this.gkCoordinates,
    this.goalShotCoordinates,
    this.goalMouthCoordinates,
    this.goalkeeper,
  });

  GoalSimulation.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? GSPlayer.fromJson(json['player']) : null;
    eventType = json['eventType'];
    time = json['time'];
    isHome = json['isHome'];
    isAssist = json['isAssist'];
    playerCoordinates = json['playerCoordinates'] != null ? PlayerCoordinates.fromJson(json['playerCoordinates']) : null;
    passEndCoordinates = json['passEndCoordinates'] != null ? PlayerCoordinates.fromJson(json['passEndCoordinates']) : null;
    bodyPart = json['bodyPart'];
    goalType = json['goalType'];
    gkCoordinates = json['gkCoordinates'] != null ? PlayerCoordinates.fromJson(json['gkCoordinates']) : null;
    goalShotCoordinates = json['goalShotCoordinates'] != null ? PlayerCoordinates.fromJson(json['goalShotCoordinates']) : null;
    goalMouthCoordinates = json['goalMouthCoordinates'] != null ? PlayerCoordinates.fromJson(json['goalMouthCoordinates']) : null;
    goalkeeper = json['goalkeeper'] != null ? Player.fromJson(json['goalkeeper']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = player!.toJson();
    }
    data['eventType'] = eventType;
    data['time'] = time;
    data['isHome'] = isHome;
    data['isAssist'] = isAssist;
    if (this.playerCoordinates != null) {
      data['playerCoordinates'] = playerCoordinates!.toJson();
    }
    if (this.passEndCoordinates != null) {
      data['passEndCoordinates'] = passEndCoordinates!.toJson();
    }
    data['bodyPart'] = bodyPart;
    data['goalType'] = goalType;
    if (this.gkCoordinates != null) {
      data['gkCoordinates'] = gkCoordinates!.toJson();
    }
    if (this.goalShotCoordinates != null) {
      data['goalShotCoordinates'] = goalShotCoordinates!.toJson();
    }
    if (this.goalMouthCoordinates != null) {
      data['goalMouthCoordinates'] = goalMouthCoordinates!.toJson();
    }
    if (this.goalkeeper != null) {
      data['goalkeeper'] = goalkeeper!.toJson();
    }
    return data;
  }
}

class GSPlayer {
  String? id;
  String? name;
  int? shirtNumber;

  GSPlayer({this.id, this.name, this.shirtNumber});

  GSPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shirtNumber = json['shirtNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['shirtNumber'] = shirtNumber;
    return data;
  }
}

class PlayerCoordinates {
  num? x;
  num? y;

  PlayerCoordinates({this.x, this.y});

  PlayerCoordinates.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Corners {
  String? text;
  Null? confirmed;
  String? incidentType;
  int? time;
  bool? isHome;
  String? incidentClass;
  Null? sequence;
  Player? player;
  Null? playerIn;
  Null? playerOut;
  Player? assist1;

  Corners({
    this.text,
    this.confirmed,
    this.incidentType,
    this.time,
    this.isHome,
    this.incidentClass,
    this.sequence,
    this.player,
    this.playerIn,
    this.playerOut,
    this.assist1,
  });

  Corners.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    confirmed = json['confirmed'];
    incidentType = json['incidentType'];
    time = json['time'];
    isHome = json['isHome'];
    incidentClass = json['incidentClass'];
    sequence = json['sequence'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    playerIn = json['playerIn'];
    playerOut = json['playerOut'];
    assist1 = json['assist1'] != null ? Player.fromJson(json['assist1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['confirmed'] = confirmed;
    data['incidentType'] = incidentType;
    data['time'] = time;
    data['isHome'] = isHome;
    data['incidentClass'] = incidentClass;
    data['sequence'] = sequence;
    if (this.player != null) {
      data['player'] = player!.toJson();
    }
    data['playerIn'] = playerIn;
    data['playerOut'] = playerOut;
    if (this.assist1 != null) {
      data['assist1'] = assist1!.toJson();
    }
    return data;
  }
}

class Cards {
  String? text;
  Null? confirmed;
  String? incidentType;
  int? time;
  int? addedTime;
  bool? isHome;
  String? incidentClass;
  Null? sequence;
  Player? player;
  Null? playerIn;
  Null? playerOut;
  Player? assist1;
  String? cardReason;

  Cards({
    this.text,
    this.confirmed,
    this.incidentType,
    this.time,
    this.addedTime,
    this.isHome,
    this.incidentClass,
    this.sequence,
    this.player,
    this.playerIn,
    this.playerOut,
    this.assist1,
    this.cardReason,
  });

  Cards.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    confirmed = json['confirmed'];
    incidentType = json['incidentType'];
    time = json['time'];
    addedTime = json['addedTime'];
    isHome = json['isHome'];
    incidentClass = json['incidentClass'];
    sequence = json['sequence'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    playerIn = json['playerIn'];
    playerOut = json['playerOut'];
    assist1 = json['assist1'] != null ? Player.fromJson(json['assist1']) : null;
    cardReason = json['cardReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['confirmed'] = confirmed;
    data['incidentType'] = incidentType;
    data['time'] = time;
    data['addedTime'] = addedTime;
    data['isHome'] = isHome;
    data['incidentClass'] = incidentClass;
    data['sequence'] = sequence;
    if (this.player != null) {
      data['player'] = player!.toJson();
    }
    data['playerIn'] = playerIn;
    data['playerOut'] = playerOut;
    if (this.assist1 != null) {
      data['assist1'] = assist1!.toJson();
    }
    data['cardReason'] = cardReason;
    return data;
  }
}

class Goals {
  String? incidentType;
  String? incidentClass;
  bool? isHome;
  int? time;
  Player? player;
  Player? assist1;

  Goals({this.incidentType, this.incidentClass, this.isHome, this.time, this.player, this.assist1});

  Goals.fromJson(Map<String, dynamic> json) {
    incidentType = json['incidentType'];
    incidentClass = json['incidentClass'];
    isHome = json['isHome'];
    time = json['time'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    assist1 = json['assist1'] != null ? Player.fromJson(json['assist1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['incidentType'] = incidentType;
    data['incidentClass'] = incidentClass;
    data['isHome'] = isHome;
    data['time'] = time;
    if (this.player != null) {
      data['player'] = player!.toJson();
    }
    if (this.assist1 != null) {
      data['assist1'] = assist1!.toJson();
    }
    return data;
  }
}
