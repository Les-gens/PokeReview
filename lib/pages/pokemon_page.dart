import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_list_view_model.dart';
import 'package:poke_review/data/viewmodels/pokemon_view_model.dart';
import 'package:poke_review/pages/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatefulWidget {
  final String pokemonUrl;

  const PokemonPage({Key? key, required this.pokemonUrl}) : super(key: key);
  

  @override
  State<PokemonPage> createState() => _PokemonPageState();
  
}

class _PokemonPageState extends State<PokemonPage> {

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<PokemonViewModel>(context, listen: false).fetchPokemon(widget.pokemonUrl);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PokemonListViewModel>(context);
    return Center(
      child: Column(
        children: [

        ],
      ),
    )
  }
  
}