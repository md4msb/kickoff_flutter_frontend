// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kickoff_flutter/features/team-splitter/data/teams_info_model.dart';
import 'package:kickoff_flutter/features/team-splitter/presentation/splitted_teams.dart';
import 'features/home/presentation/home_page.dart';
import 'features/team-splitter/presentation/players_list_page.dart';

// Routing Configuration
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/players-list', builder: (context, state) => const PlayersListPage()),
    GoRoute(path: '/splitted-teams', builder: (context, state) {
      var teams = state.extra as Teams;
      return SplittedTeams(teamInfo: teams);
    }),
    
  ],
);