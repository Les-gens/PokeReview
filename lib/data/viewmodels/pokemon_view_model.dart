import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon.dart';
import 'package:poke_review/data/providers/pokemon_api_provider.dart';

class PokemonListViewModel extends ChangeNotifier {
  PokemonViewModel pokemon = PokemonViewModel(pokemon: ); 

  Future<void> fetchPokemon(String pokemon_url) async {
    final results =  await PokemonApiProvider().getPokemon(pokemon_url);
    pokemon = PokemonViewModel(pokemon: results);
    notifyListeners();
  }
}

class PokemonViewModel {
  final Pokemon pokemon;

  PokemonViewModel({required this.pokemon});

  String? get name {
    return pokemon.name;
  }

}