// Players List page
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kickoff_flutter/features/team-splitter/data/players_repo.dart';
import 'package:kickoff_flutter/widgets/player_tile.dart';
import '../../../widgets/app_header.dart';
import '../../../widgets/search_bar_outline.dart';
import '../data/player_model.dart';
import '../data/teams_info_model.dart';

class PlayersListPage extends StatefulWidget {
  const PlayersListPage({super.key});

  @override
  State<PlayersListPage> createState() => _PlayersListPageState();
}

class _PlayersListPageState extends State<PlayersListPage> {
  final playersRepo = PlayersRepository();

  List<Player> players = [];
  List<Player> selectedPlayers = [];
  bool selectAll = false;

  @override
  void initState() {
    fetchAllPlayers();
    super.initState();
  }

  fetchAllPlayers() async {
    var playerData = await playersRepo.getAllPlayers();

    if (playerData != null) {
      players = playerData;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 249, 245),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),

            //search bar
            const SearchBarOutline(),

            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5),
              child: Row(
                children: [
                  Checkbox(
                      value: selectAll,
                      onChanged: (v) {
                        if ((v ?? false)) {
                          selectedPlayers.clear();
                          selectedPlayers.addAll(players);
                        } else {
                          selectedPlayers.clear();
                        }
                        setState(() => selectAll = v ?? false);
                      }),
                  const SizedBox(width: 5),
                  const Text(
                    "Select All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF808080),
                    ),
                  ),
                ],
              ),
            ),

            //Players list
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  var player = players[index];
                  return PlayerTile(
                    player,
                    onTap: () {
                      if (!selectedPlayers.contains(player)) {
                        selectedPlayers.add(player);
                      } else {
                        selectedPlayers.remove(player);
                      }
                      setState(() {});
                    },
                    isSelected: selectedPlayers.contains(player),
                  );
                },
              ),
            ),

            //Split team button
            Opacity(
              opacity: (selectedPlayers.length > 1) ? 1.0 : 0.3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xff2cdf95),
                    ),
                    backgroundBuilder: (context, states, child) => Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 10),
                      width: double.infinity,
                      child: child,
                    ),
                    // textStyle:
                  ),
                  onPressed: () async {
                    if (selectedPlayers.length > 1) {
                      var playersJson = selectedPlayers.map((v) => v.toJson()).toList();
                      Teams? teams = await playersRepo
                          .getSplittedTeams({"players": playersJson});
                      if ((teams?.team1 ?? []).isNotEmpty) {
                        if (context.mounted) {
                          context.go('/splitted-teams', extra: teams);
                        }
                      }
                    }
                  },
                  child: const Text(
                    'Split Team',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
