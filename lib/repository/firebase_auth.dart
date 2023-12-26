import 'package:firebase_auth/firebase_auth.dart';
import 'package:listening_app/repository/abstract/base_firebase_service.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  User get loginUser => auth.currentUser!;

  @override
  bool isUserLoggedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
    final userCredentials =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredentials;
  }

  @override
  void signOutuser() {
    auth.signOut();
  }

  @override
  Future<UserCredential> signupUserWithFirebase(String email, String password) {
    final userCredential =
        auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
