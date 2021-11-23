import 'package:flutter/material.dart';
import 'package:poke_review/data/models/user_model.dart';
import 'package:poke_review/data/providers/auth_base.dart';
import 'package:poke_review/data/providers/firebase_auth_provider.dart';

class UserViewModel extends ChangeNotifier {

  @override
  Future<void> createUserModelWithEmailandPassword(String email, String password) async {
   final user = await FirebaseAuthProvider().createUserModelWithEmailandPassword(email, password);

   notifyListeners();
  }

  @override
  Future<void> currentUser() async {
    final user = await FirebaseAuthProvider().currentUser();
    notifyListeners();
  }

  @override
  Future<void> signInWithEmailandPassword(String email, String password) async {
    final user = await FirebaseAuthProvider().signInWithEmailandPassword(email, password);

    notifyListeners();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuthProvider().signOut();

    notifyListeners();
  }

}