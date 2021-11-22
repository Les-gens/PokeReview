import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/one_pokemon_view_model.dart';
import 'package:poke_review/pages/widgets/custom_scaffold.dart';
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
    Provider.of<OnePokemonViewModel>(context, listen: false).fetchPokemon(widget.pokemonUrl);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<OnePokemonViewModel>(context);
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            Text(vm.pokemon?.name ?? 'Totosaur'),
            Text(vm.pokemon?.weight.toString() ?? '300lbs'),
            Text(vm.pokemon?.height.toString() ?? '5feet'),
            for(var item in vm.pokemon?.types ?? [] ) Text(item.type.name),

          ],
        ),
      ),
    );
  }
  
}