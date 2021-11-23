import 'package:poke_review/data/models/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> currentUser();
  Future<bool> signOut();
  Future<UserModel?> signInWithEmailandPassword(String email, String password);
  Future<UserModel?> createUserModelWithEmailandPassword(
      String email, String password);
}