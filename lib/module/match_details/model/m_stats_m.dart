class MatchStatsModel {
  int? code;
  MStatsData? data;
  String? message;

  MatchStatsModel({this.code, this.data, this.message});

  MatchStatsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? MStatsData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class MStatsData {
  List<Statistics>? statistics;

  MStatsData({this.statistics});

  MStatsData.fromJson(Map<String, dynamic> json) {
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(Statistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (statistics != null) {
      data['statistics'] = statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statistics {
  String? period;
  List<Groups>? groups;

  Statistics({this.period, this.groups});

  Statistics.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['period'] = period;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  String? groupName;
  List<StatisticsItems>? statisticsItems;

  Groups({this.groupName, this.statisticsItems});

  Groups.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['statisticsItems'] != null) {
      statisticsItems = <StatisticsItems>[];
      json['statisticsItems'].forEach((v) {
        statisticsItems!.add(StatisticsItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupName'] = groupName;
    if (statisticsItems != null) {
      data['statisticsItems'] = statisticsItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatisticsItems {
  String? name;
  String? home;
  String? away;
  int? compareCode;
  int? homeValue;
  int? awayValue;
  String? fields;

  StatisticsItems({this.name, this.home, this.away, this.compareCode, this.homeValue, this.awayValue, this.fields});

  StatisticsItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    home = json['home'];
    away = json['away'];
    compareCode = json['compareCode'];
    homeValue = json['homeValue'];
    awayValue = json['awayValue'];
    fields = json['fields'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['home'] = home;
    data['away'] = away;
    data['compareCode'] = compareCode;
    data['homeValue'] = homeValue;
    data['awayValue'] = awayValue;
    data['fields'] = fields;
    return data;
  }
}
