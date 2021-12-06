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
          SizedBox(
            height: 100,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('comments').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var res = [];
                if (snapshot.hasData) {
                  for (QueryDocumentSnapshot<Object?> i in snapshot.data!.docs){
                    res.add(i["content"]);
                  }
                }
                if (snapshot.connectionState.toString() == ConnectionState.active.toString()) {
                  return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {  
                      return Text(res[index]);
                    }, 
                    separatorBuilder: (BuildContext context, int index) => const Divider(), 
                    itemCount: res.length,
                  );
                } else {
                  return const CircularProgressIndicator();
                }

              },
            ),
          )
        ],
      )
    );
  }
  
}




// return snapshot.data?.docs[index]
//                     return Text(snapshot.data?.docs[index][])
//                       Text(comment['content']),
//                     });