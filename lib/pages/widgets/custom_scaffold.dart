import 'package:flutter/material.dart';
import 'package:poke_review/data/viewmodels/user_view_model.dart';
import 'package:poke_review/pages/auth/signin_screen.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    var routeName = ModalRoute.of(context)!.settings.name;
    return Scaffold(

      appBar: AppBar(
        title: const Text('PokeReview'),
        actions: [
          routeName == '/pokemon_details' ? IconButton(
            onPressed: () => {
               Navigator.pop(context)
            }, 
            icon: const Icon(Icons.close)) : const Text('')
        ],
      ),
      body: Center(
        child: body,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero, 
            children: [
              TextButton(
                onPressed: () async {
                  await UserViewModel().signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignInScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Log out')
              )
            ]
          )
        ),
      ),
    );
  }
}
