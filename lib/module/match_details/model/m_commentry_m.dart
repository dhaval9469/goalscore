class MatchCommentryModel {
  int? code;
  int? errorCode;
  String? message;
  Data? data;

  MatchCommentryModel({this.code, this.errorCode, this.message, this.data});

  MatchCommentryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Comments>? comments;

  Data({this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? text;
  String? time;
  int? position;
  String? incidentType;
  String? incidentClass;
  int? timeSec;
  String? type;
  Player? player;
  int? homeScore;
  int? awayScore;
  List<GoalSimulation>? goalSimulation;
  Player? assist1;
  Player? playerIn;
  Player? playerOut;

  Comments(
      {this.text,
        this.time,
        this.position,
        this.incidentType,
        this.incidentClass,
        this.timeSec,
        this.type,
        this.player,
        this.homeScore,
        this.awayScore,
        this.goalSimulation,
        this.assist1,
        this.playerIn,
        this.playerOut});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    time = json['time'];
    position = json['position'];
    incidentType = json['incidentType'];
    incidentClass = json['incidentClass'];
    timeSec = json['timeSec'];
    type = json['type'];
    player =
    json['player'] != null ? new Player.fromJson(json['player']) : null;
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];
    if (json['goalSimulation'] != null) {
      goalSimulation = <GoalSimulation>[];
      json['goalSimulation'].forEach((v) {
        goalSimulation!.add(new GoalSimulation.fromJson(v));
      });
    }
    assist1 =
    json['assist1'] != null ? new Player.fromJson(json['assist1']) : null;
    playerIn =
    json['playerIn'] != null ? new Player.fromJson(json['playerIn']) : null;
    playerOut = json['playerOut'] != null
        ? new Player.fromJson(json['playerOut'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['time'] = this.time;
    data['position'] = this.position;
    data['incidentType'] = this.incidentType;
    data['incidentClass'] = this.incidentClass;
    data['timeSec'] = this.timeSec;
    data['type'] = this.type;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['homeScore'] = this.homeScore;
    data['awayScore'] = this.awayScore;
    if (this.goalSimulation != null) {
      data['goalSimulation'] =
          this.goalSimulation!.map((v) => v.toJson()).toList();
    }
    if (this.assist1 != null) {
      data['assist1'] = this.assist1!.toJson();
    }
    if (this.playerIn != null) {
      data['playerIn'] = this.playerIn!.toJson();
    }
    if (this.playerOut != null) {
      data['playerOut'] = this.playerOut!.toJson();
    }
    return data;
  }
}

class Player {
  String? id;
  String? name;

  Player({this.id, this.name});

  Player.fromJson(Map<String, dynamic> json) {
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

class GoalSimulation {
  GPlayer? player;
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

  GoalSimulation(
      {this.player,
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
        this.goalkeeper});

  GoalSimulation.fromJson(Map<String, dynamic> json) {
    player =
    json['player'] != null ? new GPlayer.fromJson(json['player']) : null;
    eventType = json['eventType'];
    time = json['time'];
    isHome = json['isHome'];
    isAssist = json['isAssist'];
    playerCoordinates = json['playerCoordinates'] != null
        ? new PlayerCoordinates.fromJson(json['playerCoordinates'])
        : null;
    passEndCoordinates = json['passEndCoordinates'] != null
        ? new PlayerCoordinates.fromJson(json['passEndCoordinates'])
        : null;
    bodyPart = json['bodyPart'];
    goalType = json['goalType'];
    gkCoordinates = json['gkCoordinates'] != null
        ? new PlayerCoordinates.fromJson(json['gkCoordinates'])
        : null;
    goalShotCoordinates = json['goalShotCoordinates'] != null
        ? new PlayerCoordinates.fromJson(json['goalShotCoordinates'])
        : null;
    goalMouthCoordinates = json['goalMouthCoordinates'] != null
        ? new PlayerCoordinates.fromJson(json['goalMouthCoordinates'])
        : null;
    goalkeeper = json['goalkeeper'] != null
        ? new Player.fromJson(json['goalkeeper'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['eventType'] = this.eventType;
    data['time'] = this.time;
    data['isHome'] = this.isHome;
    data['isAssist'] = this.isAssist;
    if (this.playerCoordinates != null) {
      data['playerCoordinates'] = this.playerCoordinates!.toJson();
    }
    if (this.passEndCoordinates != null) {
      data['passEndCoordinates'] = this.passEndCoordinates!.toJson();
    }
    data['bodyPart'] = this.bodyPart;
    data['goalType'] = this.goalType;
    if (this.gkCoordinates != null) {
      data['gkCoordinates'] = this.gkCoordinates!.toJson();
    }
    if (this.goalShotCoordinates != null) {
      data['goalShotCoordinates'] = this.goalShotCoordinates!.toJson();
    }
    if (this.goalMouthCoordinates != null) {
      data['goalMouthCoordinates'] = this.goalMouthCoordinates!.toJson();
    }
    if (this.goalkeeper != null) {
      data['goalkeeper'] = this.goalkeeper!.toJson();
    }
    return data;
  }
}

class GPlayer {
  String? id;
  String? name;
  int? shirtNumber;

  GPlayer({this.id, this.name, this.shirtNumber});

  GPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shirtNumber = json['shirtNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shirtNumber'] = this.shirtNumber;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
