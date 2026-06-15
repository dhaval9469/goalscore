class AllLeaguesModel {
  final List<LeagueModel>? popular;
  final List<LeagueModel>? international;
  final List<CountryModel>? countries;

  AllLeaguesModel({
    this.popular,
    this.international,
    this.countries,
  });

  factory AllLeaguesModel.fromJson(Map<String, dynamic> json) {
    return AllLeaguesModel(
      popular: json['popular'] == null
          ? []
          : List<LeagueModel>.from(
        json['popular'].map((x) => LeagueModel.fromJson(x)),
      ),
      international: json['international'] == null
          ? []
          : List<LeagueModel>.from(
        json['international'].map((x) => LeagueModel.fromJson(x)),
      ),
      countries: json['countries'] == null
          ? []
          : List<CountryModel>.from(
        json['countries'].map((x) => CountryModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'popular': popular?.map((x) => x.toJson()).toList(),
      'international': international?.map((x) => x.toJson()).toList(),
      'countries': countries?.map((x) => x.toJson()).toList(),
    };
  }
}

class CountryModel {
  final String? ccode;
  final String? name;
  final String? localizedName;
  final List<LeagueModel>? leagues;

  CountryModel({
    this.ccode,
    this.name,
    this.localizedName,
    this.leagues,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      ccode: json['ccode'],
      name: json['name'],
      localizedName: json['localizedName'],
      leagues: json['leagues'] == null
          ? []
          : List<LeagueModel>.from(
        json['leagues'].map((x) => LeagueModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ccode': ccode,
      'name': name,
      'localizedName': localizedName,
      'leagues': leagues?.map((x) => x.toJson()).toList(),
    };
  }
}

class LeagueModel {
  final int? id;
  final String? name;
  final String? localizedName;
  final String? pageUrl;
  final String? ccode;

  LeagueModel({
    this.id,
    this.name,
    this.localizedName,
    this.pageUrl,
    this.ccode,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      pageUrl: json['pageUrl'],
      ccode: json['ccode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'localizedName': localizedName,
      'pageUrl': pageUrl,
      'ccode': ccode,
    };
  }
}