import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

final inputLoginMail =
    StateProvider.autoDispose((ref) => TextEditingController());

final inputLoginPassword =
    StateProvider.autoDispose((ref) => TextEditingController());

final isHidden = StateProvider((ref) => true);

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password) async {
    setLoader(true);
    try {
      _userCredential = await fauth.loginUserWithFirebase(email, password);
      setLoader(false);
      return _userCredential!;
    } catch (e) {
      debugPrint(e.toString());
      setLoader(false);
      return Future.error(e);
    }
  }

  Future<UserCredential?> signupUserWithFirebase(
      String email, String password) async {
    // var isSucces = false;
    setLoader(true);
    _userCredential = await fauth.signupUserWithFirebase(email, password);
    //TODO:https://www.youtube.com/watch?v=wpW7mM3AEXI の21分ごろの処理を追加するが、
    //modelクラスを作ってFreezedでつくったほうがよさそうなやつ
    //上記の参考サイトだとログイン画面でユーザ名があるからそれも一緒にログイン認証時に
    //Firestoreに登録する処理をしているようだが。こっちは必要なさそう。
    // final data = {
    //   'email': email,
    //   'password': password,
    //   'uid': _userCredential!.user!.uid,
    //   'createdAt': DateTime.now().microsecondsSinceEpoch.toString(),
    //   'name': name,
    //   'bio': '',
    //   'profilePic': '',
    //   'batches': [],
    // };
    if (_userCredential!.user != null) {
      debugPrint('${_userCredential!.user}');
    }
    return _userCredential;
  }

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }
}
