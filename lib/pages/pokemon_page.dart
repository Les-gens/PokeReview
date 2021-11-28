import 'package:cloud_firestore/cloud_firestore.dart';
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
    var centimeterHeight = (vm.pokemon?.height ?? 7) * 10;
    var kilogrammWeight = (vm.pokemon?.weight ?? 700) / 10; 
    return CustomScaffold(
      body: Column(
          children: [
            Text(vm.pokemon?.name ?? 'Totosaur'),
            Text(kilogrammWeight.toString()+'kg'),
            Text(centimeterHeight.toString()+'cm'),
            for(var item in vm.pokemon?.types ?? [] ) Text(item.type.name),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Comments').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children: snapshot.data?.docs.map((comment) {
                    return ListTile(
                      title: Text(comment['content']),
                    );
                  }).toList() ?? [Text('toto')],
                );
              },
            ),
          ],
        ),
    );
  }
  
}