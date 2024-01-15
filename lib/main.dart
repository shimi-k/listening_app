import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/firebase_options.dart';
import 'package:listening_app/view/home_view.dart';
import 'package:listening_app/view/login_view.dart';
import 'package:listening_app/view/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      //TODO:go_routerを使ったほうがいいかも。スプラッシュ画面も追加する
      routes: {
        '/': (context) => const LoginView(),
        '/signUpView': (context) => const SignUpView(),
        '/home': (context) => const HomeView(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
