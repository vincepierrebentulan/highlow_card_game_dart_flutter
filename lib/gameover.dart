import 'package:flutter/material.dart';
import 'gameoverbackground.dart';
import 'gamescreen.dart';
import 'homescreen.dart';

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  List<String> guessed_cards = ['', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GameOverBackground(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.purple[900],
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(guessed_cards),
                        ));
                  },
                  child: const Icon(Icons.restart_alt_outlined, size: 100)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.purple[900],
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: const Icon(Icons.arrow_back, size: 100)),
            ],
          ))
    ]);
  }
}
