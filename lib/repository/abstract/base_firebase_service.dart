import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseService {
  Future<User?> loginUserWithFirebase(String email, String password);

  Future<User?> signUpUserWithFirebase(String email, String password);

  void signOutuser();
  bool isUserLoggedIn();
}
