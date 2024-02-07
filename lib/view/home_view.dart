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
    final Size size = MediaQuery.of(context).size;

    Future<void> signOut() async {
      await authNotifier.signOutFirebase();
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        height: size.height,
        child: Column(
          children: [
            BigGenreScroller(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return itemList.when(
                    data: (data) {
                      final item = data[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.title ?? ''),
                        ),
                      );
                    },
                    error: (error, stackTrace) => Text('$error'),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                itemCount: itemList.value?.length,
              ),
            ),
          ],
        ),
      )

          //TODO:縦スクロールのみでAPIで取得したリストのみのパターン
          // CustomScrollView(
          //   scrollDirection: Axis.vertical,
          //   slivers: <Widget>[
          //     SliverAppBar(
          //       title: const Text('Home'),
          //       actions: [
          //         IconButton(
          //           onPressed: () => authNotifier.userReload(),
          //           icon: const Icon(Icons.replay_outlined),
          //         ),
          //         TextButton(
          //           onPressed: () async {
          //             await signOut();
          //             //Futureで安全にBuildするためにマウントされているか確認することでエラー回避している
          //             if (context.mounted) {
          //               Navigator.pushReplacementNamed(context, '/');
          //             }
          //           },
          //           child: const Text('Sign out'),
          //         ),
          //       ],
          //     ),
          //     SliverToBoxAdapter(
          //       child: Container(
          //         height: 200,
          //         color: Colors.blue,
          //         child: Column(
          //           children: [
          //             const Icon(
          //               Icons.account_circle,
          //               size: 150,
          //             ),
          //             Text(authNotifier.loggedInUser?.email ?? ''),
          //           ],
          //         ),
          //       ),
          //     ),
          //     SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //           return itemList.when(
          //             data: ((data) {
          //               final item = data[index];
          //               return Card(
          //                 color: Colors.blue[100],
          //                 child: ListTile(
          //                   dense: true,
          //                   isThreeLine: true,
          //                   leading: Text(genre.getGenre(item.biggenre ?? 0)),
          //                   title: Text(item.title ?? ''),
          //                   subtitle: Text(item.story ?? ''),
          //                   trailing: Text(
          //                       '${item.updatedAt?.year}/${item.updatedAt?.month}/${item.updatedAt?.day}'),
          //                   onTap: () =>
          //                       detailWebAccess.openUrl(item.ncode ?? ''),
          //                 ),
          //               );
          //             }),
          //             error: (error, stackTrace) => Text('$error'),
          //             loading: () => const Center(
          //               child: CircularProgressIndicator(),
          //             ),
          //           );
          //         },
          //         childCount: itemList.value?.length ?? 10,
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class BigGenreScroller extends StatelessWidget {
  const BigGenreScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: bigGenreList.map((g) {
            return Card(
              color: Colors.amber,
              child: Text(
                g,
                style: TextStyle(fontSize: 30),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
