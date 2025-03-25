import 'package:flutter/material.dart';

import '../../../widgets/app_header.dart';
import '../../../widgets/player_tile.dart';
import '../data/teams_info_model.dart';

class SplittedTeams extends StatelessWidget {
  const SplittedTeams({super.key, required this.teamInfo});

  final Teams teamInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 249, 245),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5, top: 5),
                    child: Text(
                      "Team One",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: teamInfo.team1?.length,
                    itemBuilder: (context, index) {
                      var player = teamInfo.team1?[index];
                      return PlayerTile(
                        player,
                        isSelected: false,
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5, top: 10),
                    child: Text(
                      "Team Two",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: teamInfo.team2?.length,
                    itemBuilder: (context, index) {
                      var player = teamInfo.team2?[index];
                      return PlayerTile(
                        player,
                        isSelected: false,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
