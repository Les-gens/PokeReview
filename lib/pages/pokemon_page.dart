import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/data/providers/comments_provider.dart';
import 'package:poke_review/data/viewmodels/one_pokemon_view_model.dart';
import 'package:poke_review/pages/widgets/comment_form.dart';
import 'package:poke_review/pages/widgets/custom_scaffold.dart';
import 'package:poke_review/pages/widgets/pokemon_details.dart';
import 'package:provider/provider.dart';
import 'package:poke_review/data/models/comment.dart';

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
    Provider.of<OnePokemonViewModel>(context, listen: false)
        .fetchPokemon(widget.pokemonUrl);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<OnePokemonViewModel>(context);
    final commentsStream = Provider.of<CommentsProvider>(context)
        .getCommentsFromPokemon(vm.pokemon?.id);
    final user = FirebaseAuth.instance.currentUser;

    return CustomScaffold(
        body: Column(
      children: [
        PokemonDetails(pokemon: vm.pokemon),
        Text('Reviews'),
        IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CommentForm(pokemonID: vm.pokemon!.id.toString())),
              );
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add a review'),
        StreamBuilder<List<Comment>>(
          stream: commentsStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
            if (snapshot.hasError) {
              return Text('Oops something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            print(snapshot);
            return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: snapshot.data!.map((Comment comment) {
                  return Card(
                      child: ListTile(
                    title: Text(
                        '${comment.username ?? 'Unknown:'}: ${comment.content}'),
                  ));
                }).toList());
          },
        ),
      ],
    ));
  }
}

class CommentTile extends StatelessWidget {
  Comment comment;

  CommentTile(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.content ?? 'hello'),
    );
  }
}

// return snapshot.data?.docs[index]
//                     return Text(snapshot.data?.docs[index][])
//                       Text(comment['content']),
//                     });
