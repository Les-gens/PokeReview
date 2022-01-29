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
      children: [//Title
        Text(getCapitalizeString(pokemon?.name) ?? 'Unknow', style: const TextStyle(fontSize: 25, fontFamily: 'PokemonClassic')),
        Text('No.${pokemon?.id ?? 'Unknow'}' , style: const TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'PokemonClassic')),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.black12,
            child: Column(//Image
              children: [
                img_url != null ? 
                Image.network(img_url, height: 200, width: 200, fit: BoxFit.contain) : 
                Image.asset('assets/unknown_pokemon.png', height: 200, width: 200, fit: BoxFit.cover),
              ],
            ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(//Details
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [//Weight
                              const Text('Weight', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'PokemonClassic')),
                              Text(kilogrammWeight.toString()+' Kg', style: const TextStyle(fontSize: 12, fontFamily: 'PokemonClassic')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [//Size
                              const Text('Size', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'PokemonClassic')),
                              Text(centimeterHeight.toString()+' Cm', style: const TextStyle(fontSize: 12, fontFamily: 'PokemonClassic')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [//Base Experience
                              const Text('Base Exp', style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'PokemonClassic')),
                              Text('${pokemon?.experience ?? 0} xp', style: const TextStyle(fontSize: 12, fontFamily: 'PokemonClassic')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [//Types
                              const Text('Types', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'PokemonClassic')),
                              for(var item in pokemon?.types ?? [] ) Text(item.type.name, style: const TextStyle(fontSize: 12, fontFamily: 'PokemonClassic')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [//Abilities
                              const Text('Abilities', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'PokemonClassic')),
                              Table(
                                defaultColumnWidth: const FixedColumnWidth(130.0),  
                                border: TableBorder.all(  
                                    color: Colors.white,  
                                    style: BorderStyle.solid,  
                                    width: 1),  
                                children: [
                                   for(var item in pokemon?.abilities ?? [] )
                                   TableRow( children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child:
                                          Text(item.ability.name, style: const TextStyle(fontSize: 12, fontFamily: 'PokemonClassic')),
                                      )
                                    ])
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  String? getCapitalizeString(String? str) {
    if(str == null){
      return null;
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

}