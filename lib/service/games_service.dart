import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_games/models/game_model.dart';
import 'package:http/http.dart' as http;
import '../constants/service_constants.dart';

class GameService extends ChangeNotifier {
  List<Results> lista =[];
  List<Results> lista1 =[];
  List<Results> lista2 =[];
 var json;

  Future<List<Results>> getData() async {
    final response = await http
        .get(Uri.parse(ServiceConstants.urlgames1));
     var decodejson = jsonDecode(response.body);
     decodejson['results'].forEach((item)=> lista.add(Results.fromJson(item)));
     return lista;
  }
  Future<List<Results>> getData1() async {
    final response = await http
        .get(Uri.parse(ServiceConstants.urlgames2));
    var decodejson = jsonDecode(response.body);
    decodejson['results'].forEach((item)=> lista1.add(Results.fromJson(item)));
    return lista1;
  }

  Future<void> getScreen() async {
    final response = await http
        .get(Uri.parse('https://videogamesapi.herokuapp.com/api/screenshots/'));
    json = jsonDecode(response.body);
    return json;
  }

}
