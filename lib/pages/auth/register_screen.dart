import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/user_view_model.dart';
import 'package:poke_review/pages/pokemon_list_page.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'signin_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _submit(email, password) async {

    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);

    try {
      await _userViewModel.createUserModelWithEmailandPassword(email, password);
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const PokemonListPage()),
      );
    }
    on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ops! Register Failed'),
          content: Text('${e.message}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            )
          ],
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
          key: _key,
          child: Column(
            children: [
            TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'erreur';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () async =>
                  _submit(_emailController.text, _passwordController.text),
              child: Text('Valider')),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        },
        child: const Text('Already have an account ? Sign in'),

      ),
      ],
    ),)
    );
  }
}
