import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'tic_tac_toe.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: const LoadingScreen(),
    );
  }
}
