class Players {
  List<Player>? players;

  Players({this.players});

  Players.fromJson(json) {
    if (json != null && (json as List).isNotEmpty) {
      players = <Player>[];
      for (var v in json) {
        players!.add(Player.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? position;
  int? strength;

  Player({this.id, this.name, this.position, this.strength});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    strength = json['strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['strength'] = strength;
    return data;
  }
}
