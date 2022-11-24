import 'package:flutter/material.dart';
import 'package:flutter_games/constants/string_constants.dart';
import '../components/game_list1.dart';
import '../components/top_card.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.black])),
        child: ListView(children: [
          const TopCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  StringConstants.topThisYear,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset('image/fire.png'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const GameList1(),
        ]),
      ),
    );
  }
}
