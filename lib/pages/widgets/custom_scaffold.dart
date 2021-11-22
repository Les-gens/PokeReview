import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeReview'),
      ),
      body: Center(
        child: body,
      ),
    );
  }
}