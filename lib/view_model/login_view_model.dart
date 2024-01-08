import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';
import 'package:listening_app/view_model/common/toast.dart';

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

final inputLoginMail =
    StateProvider.autoDispose((ref) => TextEditingController());

final inputLoginPassword =
    StateProvider.autoDispose((ref) => TextEditingController());

final isHidden = StateProvider((ref) => true);

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String msg = 'Login is successfuly';
  String errorMsg = 'Some error happend';
  FirebaseAuthClass fauth = FirebaseAuthClass();

  bool get isLoading => _isLoading;

  Future<bool> loginUserWithFirebase(String email, String password) async {
    setLoader(true);

    User? user = await fauth.loginUserWithFirebase(email, password);

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
