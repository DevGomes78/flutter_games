import 'package:flutter/material.dart';
import 'package:flutter_games/components/game_list_popular.dart';
import 'package:flutter_games/service/games_service.dart';
import 'package:provider/provider.dart';

import '../components/game-list.dart';
import '../components/game_list1.dart';
import '../components/list_console.dart';
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
      body: ListView(children: const [
        TopCard(),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Top this year',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        GameList1(),
      ]),
    );
  }
}
