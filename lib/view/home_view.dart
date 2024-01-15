import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/view_model/home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(homeAuthProvider);

    Future<void> signOut() async {
      await authNotifier.signOutFirebase();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              signOut()
                  .then((_) => Navigator.pushReplacementNamed(context, '/'));
            },
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'サインアウト',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
