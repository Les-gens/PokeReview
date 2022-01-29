import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poke_review/pages/profile_page.dart';
import 'package:poke_review/signin_screen.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    var routeName = ModalRoute.of(context)!.settings.name;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PokeReview',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 203, 5),
              fontSize: 30,
              fontFamily: 'PokemonSolid'),
        ),
        actions: [
          routeName == '/pokemon_details' || routeName == '/profile_page'
              ? IconButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                      },
                  icon: const Icon(Icons.close))
              : const Text('')
        ],
      ),
      body: Center(
        child: body,
      ),
      drawer: Drawer(
        child: SafeArea(
            child: ListView(padding: EdgeInsets.zero, children: [
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignInScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Log out')),
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: '/profile_page'),
                    builder: (BuildContext context) => const ProfilePage(),
                  ),
                );
              },
              child: const Text('Profil page'))
        ])),
      ),
    );
  }
}
