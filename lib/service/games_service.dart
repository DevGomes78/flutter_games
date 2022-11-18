import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_games/models/game_model.dart';
import 'package:http/http.dart' as http;

class GameService extends ChangeNotifier {
  List<Results> lista =[];
  List<Results> lista1 =[];
  List<Results> lista2 =[];
  Future<List<Results>> getData() async {
    final response = await http
        .get(Uri.parse('https://videogamesapi.herokuapp.com/api/games/'));
     var decodejson = jsonDecode(response.body);
     decodejson['results'].forEach((item)=> lista.add(Results.fromJson(item)));
     return lista;
  }
  Future<List<Results>> getData1() async {
    final response = await http
        .get(Uri.parse('https://videogamesapi.herokuapp.com/api/games/?page=3'));
    var decodejson = jsonDecode(response.body);
    decodejson['results'].forEach((item)=> lista1.add(Results.fromJson(item)));
    return lista1;
  }
  Future<List<Results>> getConsole() async {
    final response = await http
        .get(Uri.parse('https://videogamesapi.herokuapp.com/api/platforms/?page=2'));
    var decodejson = jsonDecode(response.body);
    decodejson['results'].forEach((item)=> lista2.add(Results.fromJson(item)));
    return lista2;
  }
}
