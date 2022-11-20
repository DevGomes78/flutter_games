import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/games_service.dart';

class GameList1 extends StatefulWidget {
  const GameList1({Key? key}) : super(key: key);

  @override
  State<GameList1> createState() => _GameList1State();
}

class _GameList1State extends State<GameList1> {
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

                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                      itemCount: controller.lista.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,
                          ),
                          height: 110,
                          width: 180,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 80,
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
                              const SizedBox(width: 10),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 170,
                                      child: Text(
                                          controller.lista[index].title.toString()),
                                    ),
                                    Row(
                                      children: [
                                        const Text('Publisher:'),
                                        const SizedBox(width: 10),
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
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Row(
                                        children: const [
                                          Icon(Icons.star, color: Colors.amber),
                                          SizedBox(width: 8),
                                          Text('4.9'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [

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

