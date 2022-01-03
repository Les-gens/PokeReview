import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/one_pokemon_view_model.dart';

class PokemonDetails extends StatelessWidget{
  const PokemonDetails ({Key? key, required this.pokemon}) : super(key: key);

  final PokemonViewModel? pokemon;

  @override
  Widget build(BuildContext context) {
    var centimeterHeight = (pokemon?.height ?? 7) * 10;
    var kilogrammWeight = (pokemon?.weight ?? 700) / 10;
    var img_url = pokemon?.sprites?.backDefault;
    return Column(
      children: [
        img_url != null ? 
          Image.network(img_url, height: 150, width: 150, fit: BoxFit.fitWidth) : 
          Image.asset('assets/unknown_pokemon.png', height: 150, width: 150, fit: BoxFit.cover),
        Text(pokemon?.name ?? 'Totosaur'),
        Text(kilogrammWeight.toString()+'kg'),
        Text(centimeterHeight.toString()+'cm'),
        for(var item in pokemon?.types ?? [] ) Text(item.type.name),

      ],
    );
  }



}