import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon.dart';
import 'package:poke_review/data/providers/pokemon_api_provider.dart';

class OnePokemonViewModel extends ChangeNotifier {
  PokemonViewModel? pokemon;

  Future<void> fetchPokemon(String pokemonUrl) async {
    final results =  await PokemonApiProvider().getPokemon(pokemonUrl);
    pokemon = PokemonViewModel(pokemon: results);
    notifyListeners();
  }
}

class PokemonViewModel {
  final Pokemon pokemon;

  PokemonViewModel({required this.pokemon});

  String? get name {return pokemon.name;}

  List<Abilities>? get abilities {return pokemon.abilities;}

  int? get height {return pokemon.height;}

  int? get id {return pokemon.id;}

  bool? get isDefault {return pokemon.isDefault;}

  int? get order {return pokemon.order;}

  Sprites? get sprites {return pokemon.sprites;}

  List<Stats>? get stats {return pokemon.stats;}

  List<Types>? get types {return pokemon.types;}

  int? get weight {return pokemon.weight;}



}