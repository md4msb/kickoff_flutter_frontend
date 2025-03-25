import 'package:flutter/material.dart';

import '../features/team-splitter/data/player_model.dart';

class PlayerTile extends StatelessWidget {
  const PlayerTile(
    this.player, {
    required this.isSelected,
    this.onTap,
    super.key,
  });

  final Player? player;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
        child: Container(
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: !isSelected ? Colors.white : Colors.greenAccent.shade100,
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 12.5,
                backgroundImage: NetworkImage(
                    'https://cdn3d.iconscout.com/3d/premium/thumb/football-player-3d-icon-download-in-png-blend-fbx-gltf-file-formats--soccer-sports-avatar-pack-avatars-icons-5410596.png?f=webp'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player?.name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    player?.position ?? '',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
