
import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_list_view_model.dart';
import 'package:poke_review/data/viewmodels/one_pokemon_view_model.dart';
import 'package:poke_review/pages/pokemon_page.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget{

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  
  final PokemonListItemViewModel pokemon;

  @override
  Widget build(BuildContext context) {
    var pokemonId = pokemon.url?.split("/")[6];
    var imgUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png';
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            settings: const RouteSettings(name: '/pokemon_details'),
            builder: (context) => PokemonPage(pokemonUrl: pokemon.url ?? 'https://pokeapi.co/api/v2/pokemon/2/'),
          )
        );
      },
      child: Row(
        children: [
          Image.network(imgUrl, width: 100, height: 100),
          Text('${getCapitalizeString(pokemon.name)}', style: const TextStyle(fontSize: 25, fontFamily: 'PokemonClassic'),),

        ],
      )
    );
  }

  String? getCapitalizeString(String? str) {
    if(str == null){
      return null;
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
}
  
}