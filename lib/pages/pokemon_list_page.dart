import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_list_view_model.dart';
import 'package:poke_review/pages/widgets/custom_scaffold.dart';
import 'package:poke_review/pages/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {

  const PokemonListPage({Key? key}) : super(key: key);
  

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
  
}

class _PokemonListPageState extends State<PokemonListPage> {

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<PokemonListViewModel>(context, listen: false).fetchAllPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PokemonListViewModel>(context);
    return CustomScaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return PokemonCard(pokemon: vm.pokemons[index]);
        }, 
        separatorBuilder: (BuildContext context, int index) => const Divider(), 
        itemCount: vm.pokemons.length
      ),
    ); 
  }
  
}