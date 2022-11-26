import 'package:flutter/material.dart';
import 'package:flutter_games/models/game_model.dart';
import 'package:provider/provider.dart';

import '../constants/string_constants.dart';
import '../service/games_service.dart';

class DetailsPage extends StatefulWidget {
  Results? results;

  DetailsPage({required this.results});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  GameService controller = GameService();

  @override
  void initState() {
    controller = context.read<GameService>();
    controller.getScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameService>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.black])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        widget.results!.cover.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 5,
                      top: 20,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white38),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.white,
                            ),
                          )))
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      widget.results!.releaseDate.toString().substring(0, 4),
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    const Text('|'),
                    const SizedBox(width: 10),
                    Text(
                      widget.results!.publisher.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    const Text('|'),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '4.5',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  StringConstants.description,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: Text(widget.results!.description.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  'ScreenShots',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<void>(
                  future: controller.getScreen(),
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
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      child: SizedBox(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2.3 -
                                                5,
                                        child: Image.network(
                                          controller.json['results'][0]
                                              ['screenshot_1'],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      child: Image.network(
                                        controller.json['results'][0]
                                            ['screenshot_2'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                              2.2 -
                                          5,
                                      child: Image.network(
                                        controller.json['results'][0]
                                            ['screenshot_3'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width /
                                              2.2 -
                                          5,
                                      child: Image.network(
                                        controller.json['results'][0]
                                            ['screenshot_4'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
