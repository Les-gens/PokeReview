import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/data/providers/comments_provider.dart';
import 'package:poke_review/data/providers/firebase_auth_provider.dart';
import 'package:poke_review/pages/widgets/custom_scaffold.dart';

class CommentForm extends StatefulWidget {
  final String pokemonID;

  const CommentForm({Key? key, required this.pokemonID}) : super(key: key);

  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentContentController = TextEditingController();

  Future<void> _submit() async {
    CommentsProvider commentsProvider = CommentsProvider();
    final currentUser = FirebaseAuth.instance.currentUser;
    print('currentuser ' + currentUser.toString());
    commentsProvider.saveComment(widget.pokemonID, currentUser?.uid, _commentContentController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(children: <Widget>[
          TextFormField(controller: _commentContentController),
          ElevatedButton(
            onPressed: _submit,
            child: Text("submit"),
          ),
        ],
      ),
    ),
    );
  }
}
