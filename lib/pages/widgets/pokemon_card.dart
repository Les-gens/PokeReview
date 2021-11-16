
import 'package:flutter/material.dart';
import 'package:poke_review/data/models/pokemon.dart';
import 'package:poke_review/data/viewmodels/pokemon_view_model.dart';

class PokemonCard extends StatelessWidget{

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  
  final PokemonViewModel pokemon;

  @override
  Widget build(BuildContext context) {
    print(pokemon);
    print(pokemon);
    return Row(
      children: [
        // Image.network('${pokemon.sprites?.backDefault}'),
        Text('${pokemon.name}'),

      ],
    );
  }
  
}