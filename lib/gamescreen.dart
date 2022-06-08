// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'gameover.dart';
import 'randomcardgenerator.dart';
import 'howtoplay.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  List randomCard = CardNumber().getRandom();
  List<String> guessed_cards;
  int score = 0;
  GameScreen(this.guessed_cards, {super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void test(var c, var newcard) {
    if (c) {
      setState(() {
        widget.score += 1;
        widget.guessed_cards.insert(0, widget.randomCard[0]);
        widget.randomCard[0] = newcard[0];
        widget.randomCard[1] = newcard[1];
      });
    } else {
      setState(() {
        widget.score = 0;
        for (int i = 0; i < 4; i++) {
          widget.guessed_cards[i] = '';
        }
        widget.randomCard = newcard;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GameOver(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const HelpDialog()),
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                    size: 50,
                  )),
              Align(
                alignment: const AlignmentDirectional(0, -0.75),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        List test_card = CardNumber().getRandom();
                        test(test_card[1] < widget.randomCard[1], test_card);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          onPrimary: Colors.white,
                          fixedSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      child: const Text(
                        'LOW',
                        style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List test_card = CardNumber().getRandom();
                        test(test_card[1] >= widget.randomCard[1], test_card);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          onPrimary: Colors.white,
                          fixedSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      child: const Text(
                        'HIGH',
                        style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -0.5),
                child: SizedBox(
                  height: 75,
                  width: 150,
                  child: Text(
                    'Score: ${widget.score}',
                    style: const TextStyle(
                        fontFamily: 'Lobster',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.asset(
                        'UI/cardback.png',
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.asset(widget.randomCard[0]),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0.75),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.025),
                      height: 150,
                      width: 100,
                      child: widget.guessed_cards[0] == ''
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 2)
                                  ]),
                            )
                          : Image.asset(widget.guessed_cards[0]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.025),
                      height: 150,
                      width: 100,
                      child: widget.guessed_cards[1] == ''
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 2)
                                  ]),
                            )
                          : Image.asset(widget.guessed_cards[1]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.025),
                      height: 150,
                      width: 100,
                      child: widget.guessed_cards[2] == ''
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 2)
                                  ]),
                            )
                          : Image.asset(widget.guessed_cards[2]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.025),
                      height: 150,
                      width: 100,
                      child: widget.guessed_cards[3] == ''
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 2)
                                  ]),
                            )
                          : Image.asset(widget.guessed_cards[3]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.025),
                      height: 150,
                      width: 100,
                      child: widget.guessed_cards[4] == ''
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 2)
                                  ]),
                            )
                          : Image.asset(widget.guessed_cards[4]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
