import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/games_service.dart';

class ListConsole extends StatefulWidget {
  const ListConsole({Key? key}) : super(key: key);

  @override
  State<ListConsole> createState() => _ListConsoleState();
}

class _ListConsoleState extends State<ListConsole> {
  GameService controller2 = GameService();

  @override
  void initState() {
    controller2 = context.read<GameService>();

    controller2.getConsole();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: controller2.getConsole(),
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
              return  Container(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: controller2.lista2.length,
                      itemBuilder: (context,index){
                        return Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                          ),
                             child: Text(controller2.lista2[index].platform.toString()),
                        );
                      }),
                );
              }
          }
        });
  }
}
