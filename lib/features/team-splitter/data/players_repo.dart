import 'dart:convert';
import 'teams_info_model.dart';
import '../../../services/api_client.dart';
import 'player_model.dart';

class PlayersRequestFailure implements Exception {}

class TeamRequestFailure implements Exception {}

class PlayersRepository {
  /// Fetch all players
  Future<List<Player>?> getAllPlayers() async {
    try {
      final response = await ApiClient.get("/getAllPlayers");
      var resposeModel = Players.fromJson(response);
      return resposeModel.players;
    } catch (e) {
      throw PlayersRequestFailure();
    }
  }

  // Split teams
  Future<Teams?> getSplittedTeams(Map<String, dynamic> requestPayload) async {
    try {
      final response = await ApiClient.post("/recommend-teams", requestPayload);
      var resposeModel = TeamsInfoModel.fromJson(response);
      return resposeModel.teams;
    } catch (e) {
      throw TeamRequestFailure();
    }
  }

  /// Add multiple players
  Future<String> addNewPlayers(Map<String, dynamic> requestPayload) async {
    final response = await ApiClient.post("/addNewPlayer", requestPayload);
    return response["message"]; // Returns success message
  }
}

String getPrettyJSONString(jsonObject) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}
