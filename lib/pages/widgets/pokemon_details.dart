import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/one_pokemon_view_model.dart';

class PokemonDetails extends StatelessWidget{
  const PokemonDetails ({Key? key, required this.pokemon}) : super(key: key);

  final PokemonViewModel? pokemon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var centimeterHeight = (pokemon?.height ?? 7) * 10;
    var kilogrammWeight = (pokemon?.weight ?? 700) / 10; 
    return Column(
      children: [
        Text(pokemon?.name ?? 'Totosaur'),
        Text(kilogrammWeight.toString()+'kg'),
        Text(centimeterHeight.toString()+'cm'),
      ],
    );
  }



}