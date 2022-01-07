import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_review/data/models/comment.dart';
import 'package:poke_review/data/providers/comments_provider.dart';

class CommentsListViewModel extends ChangeNotifier {
  List<Comment> comments = <Comment>[];

 // Future<void> fetchCommentsFromPokemon(var pokemonID) async {
   // final results =  await CommentsProvider().getCommentsFromPokemon(pokemonID);
    //comments = results.map((item) => Comment(userid: item.userid, content: item.content, pokemonid: item.pokemonid)).toList();
   // notifyListeners();
 // }
}
