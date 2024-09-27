import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = List.filled(9, '', growable: false);
  bool isX = true; // To track the current player
  String gameResult = ''; // To show the result

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        backgroundColor: Colors.teal,
      ),
      body: Center(child: gamePlan()),
    );
  }

  Widget gamePlan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _handleTap(index),
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    board[index],
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            gameResult,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: _resetGame,
          child: const Text('Reset Game'),
        ),
      ],
    );
  }

  void _handleTap(int index) {
    if (board[index] != '' || gameResult.isNotEmpty) {
      // If the cell is already filled or the game has ended, ignore the tap.
      return;
    }

    setState(() {
      board[index] = isX ? 'X' : 'O';
      isX = !isX; // Toggle between X and O
      _checkWinner();
    });
  }

  void _checkWinner() {
    // List of all possible win conditions
    List<List<int>> winConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (var condition in winConditions) {
      String line = board[condition[0]] +
          board[condition[1]] +
          board[condition[2]];
      if (line == 'XXX') {
        setState(() {
          gameResult = 'Player X Wins!';
        });
        return;
      } else if (line == 'OOO') {
        setState(() {
          gameResult = 'Player O Wins!';
        });
        return;
      }
    }

    // Check for a draw
    if (!board.contains('') && gameResult.isEmpty) {
      setState(() {
        gameResult = 'It\'s a Draw!';
      });
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '', growable: false);
      isX = true;
      gameResult = '';
    });
  }
}
