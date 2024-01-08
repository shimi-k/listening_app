import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider<SignUpViewModel>((ref) => SignUpViewModel());

final inputCreateUserName =
    StateProvider.autoDispose((ref) => TextEditingController());

final inputCreateUserMail =
    StateProvider.autoDispose((ref) => TextEditingController());

final inputCreateUserPassword =
    StateProvider.autoDispose((ref) => TextEditingController());

final isLogined = StateProvider<bool>((ref) => false);

class SignUpViewModel extends ChangeNotifier {
  FirebaseAuthClass fauth = FirebaseAuthClass();

  Future<void> signupUserWithFirebase(
      String name, String email, String password) async {
    User? user = await fauth.signUpUserWithFirebase(email, password);
    if (user != null) {}
  }
}
