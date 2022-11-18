import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_games/models/game_model.dart';
import 'package:http/http.dart' as http;

class GameService extends ChangeNotifier {
  List<Results> lista =[];
  Future<List<Results>> getData() async {
    final response = await http
        .get(Uri.parse('https://videogamesapi.herokuapp.com/api/games/'));
     var decodejson = jsonDecode(response.body);
     decodejson['results'].forEach((item)=> lista.add(Results.fromJson(item)));
     return lista;
  }
}
