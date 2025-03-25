import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TournamentTile extends StatelessWidget {
  const TournamentTile({
    required this.logo,
    required this.title,
    required this.subTitle,
    this.enabled = false,
    super.key,
  });

  final String title;
  final String subTitle;
  final String logo;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: InkWell(
        onTap: () {
          if (enabled) {
            context.go('/players-list');
          }
        },
        child: Container(
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              !enabled
                  ? Image.asset(
                      logo,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                    )
                  : CircleAvatar(
                      radius: 12.5,
                      backgroundImage: AssetImage(logo),
                    ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 12,
                        fontWeight: FontWeight.w200, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.star_rate_rounded,
                  color: enabled ? Colors.amber.shade400 : Colors.yellow.shade200)
            ],
          ),
        ),
      ),
    );
  }
}