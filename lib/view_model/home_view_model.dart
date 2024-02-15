import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/repository/firebase_auth.dart';
import 'package:listening_app/view_model/common/liseten_item_genre.dart';
import 'package:listening_app/view_model/common/toast.dart';
import 'package:url_launcher/url_launcher.dart';

final tabList = ['New', '恋愛', 'ファンタジー', '文学', 'SF', 'その他', 'ノンジャンル'];

final homeAuthProvider = ChangeNotifierProvider((ref) => HomeAuthProvider());

class HomeAuthProvider extends ChangeNotifier {
  FirebaseAuthClass fauth = FirebaseAuthClass();
  String msgSignOut = 'Sign out successfuly';

  User? get loggedInUser => fauth.loginUser;

  Future<void> userReload() async {
    fauth.currentUserReload();
    notifyListeners();
  }

  Future<void> signOutFirebase() async {
    if (loggedInUser != null) {
      await fauth.signOutuser();
      showToast(msg: msgSignOut);
    }
    notifyListeners();
  }
}

class DetailWebAccess {
  final String url = 'https://ncode.syosetu.com/';

  Future<void> openUrl(String ncode) async {
    //ncodeは英字が大文字になっているため小文字に変換してurlにする
    final webUrl = Uri.parse(url + ncode.toLowerCase());
    if (await canLaunchUrl(webUrl)) {
      await launchUrl(webUrl);
    } else {
      showToast(msg: 'Cannot launch url: $webUrl');
    }
  }
}

class ListenItemGenre {
  String getGenre(int genreNo) {
    final genreName = BigGenre.fromName(genreNo);

    switch (genreName) {
      case BigGenre.love:
        return '恋愛';
      case BigGenre.fantasy:
        return 'ファンタジー';
      case BigGenre.literature:
        return '文学';
      case BigGenre.sf:
        return 'SF';
      case BigGenre.other:
        return 'その他';
      case BigGenre.nonGenre:
        return 'ノンジャンル';
      default:
        return '';
    }
  }
}
