import 'package:flutter/material.dart';

class GameOverBackground extends StatefulWidget {
  const GameOverBackground({super.key});

  @override
  State<GameOverBackground> createState() => _GameOverBackgroundState();
}

class _GameOverBackgroundState extends State<GameOverBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'UI/gameover.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
