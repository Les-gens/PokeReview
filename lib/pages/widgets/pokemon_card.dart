
import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_list_view_model.dart';

class PokemonCard extends StatelessWidget{

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  
  final PokemonListItemViewModel pokemon;

  @override
  Widget build(BuildContext context) {
    var pokemonId = pokemon.url?.split("/")[6];
    var imgUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png';
    return InkWell(
      onTap: () {

      },
      child: Row(
        children: [
          Image.network(imgUrl, width: 100, height: 100),
          Text('${pokemon.name}', style: const TextStyle(fontSize: 40),),

        ],
      )
    );
  }
  
}