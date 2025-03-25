import 'package:flutter/material.dart';

class SearchBarOutline extends StatelessWidget {
  const SearchBarOutline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xFFb6b6bb), width: 0.8)),
        child: const Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Color(0xFFb6b6bb),
            ),
            SizedBox(width: 10),
            Text(
              'Search Players',
              style: TextStyle(color: Color(0xFFb6b6bb)),
            )
          ],
        ),
      ),
    );
  }
}
