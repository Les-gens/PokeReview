import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon_list_item.dart';
import 'package:poke_review/data/providers/pokemon_api_provider.dart';

class PokemonListViewModel extends ChangeNotifier {
  List<PokemonViewModel> pokemons = <PokemonViewModel>[]; 

  Future<void> fetchPokemon() async {
    print("toot");
    final results =  await PokemonApiProvider().getAllPokemon();
    pokemons = results.map((item) => PokemonViewModel(pokemon: item)).toList();
    // pokemons.forEach((element) {print(element);});
    notifyListeners();
  }
}

class PokemonViewModel {
  final PokemonListItem pokemon;

  PokemonViewModel({required this.pokemon});

  String? get name {
    return pokemon.name;
  }
  String? get url {
    return pokemon.url;
  }

}