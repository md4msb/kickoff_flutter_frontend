// Home Page
import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../widgets/app_header.dart';
import '../../../widgets/tournament_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 245), //Color(0xFFf9f9fb),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(),
            SizedBox(height: 15),
            Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Kickoff! ⚽',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Select a tournament 🏆 & split your teams ⚔️!',
                    style: TextStyle(color: Colors.grey, height: 0.7),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            TournamentTile(
              logo: AppAssets.mudBall,
              title: 'Kandam Kalli',
              subTitle: 'Friends Club',
              enabled: true,
            ),
            TournamentTile(
              logo: AppAssets.turf,
              title: 'Turf',
              subTitle: 'Friends Club',
              enabled: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 15, bottom: 10),
              child: Text(
                "Upcoming Competition",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF808080)),
              ),
            ),
            TournamentTile(
              logo: AppAssets.uclIcon,
              title: 'Champions League',
              subTitle: 'UEFA',
            ),
            TournamentTile(
              logo: AppAssets.fifaIcon,
              title: 'World Cup 2026',
              subTitle: 'FIFA',
            ),
          ],
        ),
      ),
    );
  }
}
