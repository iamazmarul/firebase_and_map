import 'package:firebase_and_map/match_list_screen.dart';
import 'package:flutter/material.dart';

class MatchApp extends StatelessWidget {
  const MatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Live Score App",
      home: MatchListScreen(),
    );
  }
}
