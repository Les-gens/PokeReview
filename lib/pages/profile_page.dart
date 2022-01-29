import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/data/models/comment.dart';
import 'package:poke_review/data/providers/comments_provider.dart';
import 'package:poke_review/pages/pokemon_page.dart';
import 'package:poke_review/pages/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final commentsStream =
        Provider.of<CommentsProvider>(context).commentsFromCurrentUser;
    final mail = FirebaseAuth.instance.currentUser?.email;
    var imgUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';

    return CustomScaffold(
        body: Column(
      children: [
        Text(mail!),
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
                      child: Row(
                    children: [
                      imgUrl != null ?
                      Image.network('$imgUrl${comment.pokemonid}.png', height: 50, width: 50, fit: BoxFit.fitWidth) :
                      Image.asset('assets/unknown_pokemon.png', height: 150, width: 150, fit: BoxFit.cover),
                      Text('${comment.content}' ??
                          'no comment found'),
                    ],
                  ));
                }).toList());
          },
        ),
      ],
    ));
    throw UnimplementedError();
  }
}
