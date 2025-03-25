import 'package:flutter/material.dart';
import '../core/constants/app_assets.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              height: 20,
              width: 90,
            ),
          ),
          const Icon(
            Icons.menu,
            size: 26,
          )
        ],
      ),
    );
  }
}