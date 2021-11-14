import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {

  const PokemonListPage({Key? key}) : super(key: key);
  

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
  
}

class _PokemonListPageState extends State<PokemonListPage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<PokemonListViewModel>(context, listen: false).fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PokemonListViewModel>(context);
    vm.pokemons.forEach((element) {print(element.name);});
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('${vm.pokemons[index].name}')),
        );
      }, 
      separatorBuilder: (BuildContext context, int index) => const Divider(), 
      itemCount: entries.length
    );
  }
  
}