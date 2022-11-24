import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/games_service.dart';

class GamePopularList extends StatefulWidget {
  const GamePopularList({Key? key}) : super(key: key);

  @override
  State<GamePopularList> createState() => _GamePopularListState();
}

class _GamePopularListState extends State<GamePopularList> {

  GameService controller = GameService();


  @override
  void initState() {
    controller = context.read<GameService>();
    controller.getData1();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.lista1.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 5),
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  controller.lista1[index].cover.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
