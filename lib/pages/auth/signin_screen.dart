import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:poke_review/pages/pokemon_list_page.dart';


import 'register_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _submit(email, password) async {

    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);


    try {

      await _userViewModel.signInWithEmailandPassword(email, password);

      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const PokemonListPage()),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Ops! Login Failed"),
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
          title: Text('Sign In'),
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
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Don\'t have an account ? Sign up')),
            ],
          ),
        ));
  }
}
