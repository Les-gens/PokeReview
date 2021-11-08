import 'package:firebase_auth/firebase_auth.dart';
import 'package:poke_review/data/models/user_model.dart';

import 'auth_base.dart';

class FirebaseAuthProvider implements AuthBase {

  static final FirebaseAuthProvider _singleton =
  FirebaseAuthProvider._internal();

  factory FirebaseAuthProvider() => _singleton;

  FirebaseAuthProvider._internal();

  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> createUserModelWithEmailandPassword(String email, String password) async {
    try {
      UserCredential _userCred = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserModel(userID: _userCred.user!.uid, email: _userCred.user!.email);
    } catch (e) {
      print("createUserModelWithEmailandPassword err: ${e.toString()}");
      return null;
    }
  }

  @override
  Future<UserModel?> currentUser() async {
    User? user = await _fireBaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    return UserModel(userID: user.uid, email: user.email);

  }

  @override
  Future<UserModel?> signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential _userCred = await _fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(userID: _userCred.user!.uid, email: _userCred.user!.email);
    } catch (e) {
      print("signInWithEmailandPassword err: ${e.toString()}");
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _fireBaseAuth.signOut();
      return true;
    } catch (e) {
      print("err when signing out: " + e.toString());
      return false;
    }
  }

}