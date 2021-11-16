import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon.dart';
import 'package:poke_review/data/providers/pokemon_api_provider.dart';

class PokemonListViewModel extends ChangeNotifier {
  List<PokemonViewModel> pokemons = <PokemonViewModel>[]; 

  Future<void> fetchPokemon() async {
    final results =  await PokemonApiProvider().getAllPokemon();
    pokemons = results.map((item) => PokemonViewModel(pokemon: item)).toList();
    // pokemons.forEach((element) {print(element);});
    notifyListeners();
  }
}

class PokemonViewModel {
  final Pokemon pokemon;

  PokemonViewModel({required this.pokemon});

  List<Abilities>? get abilities {
    return pokemon.abilities;
  }
  int? get height {
    return pokemon.height;
  }
  int? get id {
    return pokemon.id;
  }
  bool? get isDefault {
    return pokemon.isDefault;
  }
  String? get name {
    return pokemon.name;
  }
  int? get order {
    return pokemon.order;
  }
  Sprites? get sprites {
    return pokemon.sprites;
  }
  List<Stats>? get stats {
    return pokemon.stats;
  }
  List<Types>? get types {
    return pokemon.types;
  }
  int? get weight {
    return pokemon.weight;
  }
  String? get url {
    return pokemon.url;
  }

}