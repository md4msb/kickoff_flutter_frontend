import 'player_model.dart';

class TeamsInfoModel {
  Teams? teams;

  TeamsInfoModel({this.teams});

  TeamsInfoModel.fromJson(Map<String, dynamic> json) {
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    return data;
  }
}

class Teams {
  List<Player>? team1;
  List<Player>? team2;

  Teams({this.team1, this.team2});

  Teams.fromJson(Map<String, dynamic> json) {
    if (json['team1'] != null) {
      team1 = <Player>[];
      json['team1'].forEach((v) {
        team1!.add(Player.fromJson(v));
      });
    }
    if (json['team2'] != null) {
      team2 = <Player>[];
      json['team2'].forEach((v) {
        team2!.add(Player.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team1 != null) {
      data['team1'] = team1!.map((v) => v.toJson()).toList();
    }
    if (team2 != null) {
      data['team2'] = team2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
