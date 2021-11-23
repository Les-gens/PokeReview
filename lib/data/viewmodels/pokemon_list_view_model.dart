import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon_list_item.dart';
import 'package:poke_review/data/providers/pokemon_api_provider.dart';

class PokemonListViewModel extends ChangeNotifier {
  List<PokemonListItemViewModel> pokemons = <PokemonListItemViewModel>[]; 

  Future<void> fetchAllPokemon() async {
    final results =  await PokemonApiProvider().getAllPokemon();
    pokemons = results.map((item) => PokemonListItemViewModel(pokemon: item)).toList();
    notifyListeners();
  }
}

class PokemonListItemViewModel {
  final PokemonListItem pokemon;

  PokemonListItemViewModel({required this.pokemon});

  String? get name {
    return pokemon.name;
  }
  String? get url {
    return pokemon.url;
  }

}