import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/view_model/common/listen_item_list_provider.dart';
import 'package:listening_app/view_model/home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(homeAuthProvider);
    final itemList = ref.watch(listenItemListProvider);
    final detailWebAccess = DetailWebAccess();
    final genre = ListenItemGenre();

    Future<void> signOut() async {
      await authNotifier.signOutFirebase();
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  onPressed: () => authNotifier.userReload(),
                  icon: const Icon(Icons.replay_outlined),
                ),
                TextButton(
                  onPressed: () async {
                    await signOut();
                    //Futureで安全にBuildするためにマウントされているか確認することでエラー回避している
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 150,
                      ),
                      //TODO:ログイン画面の認証情報とホーム画面の認証情報の状態が二つ存在してしまっており、
                      // ホーム画面でログアウトしてログイン画面でログイン情報を表示させようとすると別のproviderのため
                      // ユーザ情報が異なってしまっているので修正が必要。ホーム画面のメール情報がずっと残っている？
                      Text(authNotifier.loggedInUser?.email ?? ''),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return itemList.when(
                    data: ((data) {
                      final item = data[index];
                      return Card(
                        color: Colors.blue[100],
                        child: ListTile(
                          leading: Text(genre.getGenre(item.biggenre ?? 0)),
                          title: Text(item.title ?? ''),
                          subtitle: Text(item.story ?? ''),
                          trailing: Text(
                              '${item.updatedAt?.year}/${item.updatedAt?.month}/${item.updatedAt?.day}'),
                          onTap: () =>
                              detailWebAccess.openUrl(item.ncode ?? ''),
                        ),
                      );
                    }),
                    error: (error, stackTrace) => Text('$error'),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                childCount: itemList.value?.length ?? 10,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       signOut().then(
            //           (_) => Navigator.pushReplacementNamed(context, '/'));
            //     },
            //     child: Container(
            //       width: double.infinity,
            //       height: 45,
            //       decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           'サインアウト',
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Text('${authNotifier.loggedInUser?.email}'),
          ],
        ),
      ),
    );
  }
}
