import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poke_review/data/models/comment.dart';

import 'firebase_auth_provider.dart';

class CommentsProvider {
  CommentsProvider._privateConstructor();

  static final CommentsProvider _singleton =
      CommentsProvider._privateConstructor();

  final commentsCollection = FirebaseFirestore.instance.collection('comments');

  factory CommentsProvider() => _singleton;

  Comment _commentFromSnapshot(var snapshot) {
    var data = snapshot.data();

    if (data == null) {
      throw Exception('Comment not found');
    }
    return Comment(
      userid: data['userid'],
      pokemonid: data['pokemonid'],
      content: data['content'],
      username: data['username'],
    );
  }

  List<Comment> _commentsListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    var list = snapshot.docs.map((doc) {
      return _commentFromSnapshot(doc);
    }).toList();
    print('list is $list');
    return list;
  }

  Stream<List<Comment>> get comments {
    return commentsCollection.snapshots().map(_commentsListFromSnapshot);
  }

  Stream<List<Comment>> get commentsFromCurrentUser {
    final currentUser = FirebaseAuth.instance.currentUser!;
    return commentsCollection
        .where('userid', isEqualTo: currentUser.uid.toString())
        .snapshots()
        .map(_commentsListFromSnapshot);
  }

  Stream<List<Comment>> getCommentsFromPokemon(var pokemonID) {
    print('pokemonid $pokemonID');
    return commentsCollection
        .where('pokemonid', isEqualTo: pokemonID.toString())
        .snapshots()
        .map(_commentsListFromSnapshot);
  }

  Future<void> saveComment(
      var pokemonID, var userID, String content, String username) async {
    await commentsCollection.add({
      'content': content,
      'pokemonid': pokemonID,
      'userid': userID,
      'username': username,
    });
  }
}
