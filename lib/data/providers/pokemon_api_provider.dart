// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

import 'package:poke_review/data/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonApiProvider {
  static final PokemonApiProvider _singleton =
    PokemonApiProvider._internal();

  factory PokemonApiProvider() => _singleton;

  PokemonApiProvider._internal();
  
  Future<List<Pokemon>> getAllPokemon() async {
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20');
    print(uri);

    var responseFromApi = await http.get(uri);
    if(responseFromApi.statusCode == 200) {

       final body = jsonDecode(responseFromApi.body); 
       final Iterable json = body["results"];
       return json.map((pokemon) => Pokemon.fromJson(pokemon)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }

    // AllPokemonResponse resp = AllPokemonResponse.fromJson(jsonDecode(responseFromApi));
    // return resp.results;
  }

  // Future<List<Pokemon>> getOnePokemon(int id) async {
  //   var uri = Uri.parse('');

  //   var responseFromApi = await http.get(uri);
  //   OnePokemonResponse resp = OnePokemonResponse.fromJson(jsonDecode(responseFromApi));
  //   return resp.results;
  // }
}