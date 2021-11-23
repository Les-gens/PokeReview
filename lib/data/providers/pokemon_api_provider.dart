// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_review/data/models/pokemon.dart';
import 'package:poke_review/data/models/pokemon_list_item.dart';

class PokemonApiProvider {
  static final PokemonApiProvider _singleton =
    PokemonApiProvider._internal();

  factory PokemonApiProvider() => _singleton;

  PokemonApiProvider._internal();
  
  Future<List<PokemonListItem>> getAllPokemon() async {
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20');
    var responseFromApi = await http.get(uri);
    if(responseFromApi.statusCode == 200) {

       final body = jsonDecode(responseFromApi.body); 
       print(body);
       final Iterable json = body["results"];
       return json.map((pokemon) => PokemonListItem.fromJson(pokemon)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }

    // AllPokemonResponse resp = AllPokemonResponse.fromJson(jsonDecode(responseFromApi));
    // return resp.results;
  }

  Future<Pokemon> getPokemon(String pokemon_url) async{
    var uri = Uri.parse(pokemon_url);
    var responseFromApi = await http.get(uri);
    if(responseFromApi.statusCode == 200) {

       final body = jsonDecode(responseFromApi.body); 
       print(body);
       return Pokemon.fromJson(body);

    } else {
      throw Exception("Unable to perform request!");
    }
  }
  // Future<List<Pokemon>> getOnePokemon(int id) async {
  //   var uri = Uri.parse('');

  //   var responseFromApi = await http.get(uri);
  //   OnePokemonResponse resp = OnePokemonResponse.fromJson(jsonDecode(responseFromApi));
  //   return resp.results;
  // }
}