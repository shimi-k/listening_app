import 'package:firebase_auth/firebase_auth.dart';
import 'package:listening_app/repository/abstract/base_firebase_service.dart';
import 'package:listening_app/view_model/common/toast.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMsgInvalid = 'Invalid email or password.';
  String errorMsgEmailUsed = 'The email address already in use.';
  String errorMsgOhers = 'An error occured:';

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
  Future<User?> loginUserWithFirebase(String email, String password) async {
    try {
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(msg: errorMsgInvalid);
      } else {
        showToast(msg: '$errorMsgOhers ${e.code}');
      }
    }
    return null;
  }

  @override
  void signOutuser() {
    auth.signOut();
  }

  @override
  Future<User?> signUpUserWithFirebase(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(msg: errorMsgEmailUsed);
      } else {
        showToast(msg: '$errorMsgOhers ${e.code}');
      }
      return null;
    }
  }
}
