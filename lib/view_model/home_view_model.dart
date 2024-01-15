import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';
import 'package:listening_app/view_model/common/toast.dart';

final homeAuthProvider = ChangeNotifierProvider((ref) => HomeAuthProvider());

class HomeAuthProvider extends ChangeNotifier {
  FirebaseAuthClass fauth = FirebaseAuthClass();
  String msgSignOut = 'Sign out successfuly';

  late User? loggedInUser = fauth.loginUser;

  Future<void> signOutFirebase() async {
    if (loggedInUser != null) {
      await fauth.signOutuser();
      showToast(msg: msgSignOut);
    }
    notifyListeners();
  }
}
