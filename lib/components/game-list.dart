import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/games_service.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  GameService controller = GameService();

  @override
  void initState() {
    controller = context.read<GameService>();
    controller.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: controller.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('StringConstants.errorPage'),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.lista.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,
                          ),
                          height: 260,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 280,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    controller.lista[index].cover.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    controller.lista[index].title.toString()),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const Text('Publisher:'),
                                    const SizedBox(width: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.black),
                                      child: Text(controller
                                          .lista[index].publisher
                                          .toString()),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: const [
                                    Text('Rating:'),
                                    SizedBox(width: 30),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }
          }
        });
  }
}
