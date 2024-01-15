import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';
import 'package:listening_app/view_model/common/toast.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider<SignUpViewModel>((ref) => SignUpViewModel());

final inputCreateUserMail =
    StateProvider.autoDispose((ref) => TextEditingController());

final inputCreateUserPassword =
    StateProvider.autoDispose((ref) => TextEditingController());

final isLogined = StateProvider<bool>((ref) => false);

class SignUpViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String msg = 'Sign up successfuly';
  FirebaseAuthClass fauth = FirebaseAuthClass();

  bool get isLoading => _isLoading;

  Future<bool> signupUserWithFirebase(String email, String password) async {
    setLoader(true);

    User? user = await fauth.signUpUserWithFirebase(email, password);

    setLoader(false);

    if (user != null) {
      showToast(msg: msg);
      return true;
    } else {
      return false;
    }
  }

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }
}
