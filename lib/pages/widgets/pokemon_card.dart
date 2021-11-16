
import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_view_model.dart';

class PokemonCard extends StatelessWidget{

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  
  final PokemonViewModel pokemon;

  @override
  Widget build(BuildContext context) {
    var pokemonId = pokemon.url?.split("/")[6];
    // var imgUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${pokemonId}.png';
    var imgUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$pokemonId.png';
    print(imgUrl);
    return Row(
      children: [
        Image.network(imgUrl, width: 100, height: 100),
        Text('${pokemon.name}'),

      ],
    );
  }
  
}