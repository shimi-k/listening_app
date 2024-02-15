import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/view_model/common/listen_item_list_provider.dart';
import 'package:listening_app/view_model/home_view_model.dart';

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final List<Widget> tabs = tabList.map((e) => Tab(text: e)).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(homeAuthProvider);

    final Size size = MediaQuery.of(context).size;

    Future<void> signOut() async {
      await authNotifier.signOutFirebase();
    }

    return DefaultTabController(
      length: tabList.length,
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
              child: Container(
            color: Colors.blueGrey,
            height: size.height,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.blueGrey[100],
                    pinned: true,
                    title: const Text('Home'),
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.bookmark)),
                    ],
                    bottom: TabBar(
                      tabs: tabs,
                      isScrollable: true,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 150,
                            ),
                            Text(
                              authNotifier.loggedInUser?.email ?? 'No User',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            TextButton(
                                onPressed: () {
                                  signOut;
                                  Navigator.pushReplacementNamed(context, '/');
                                },
                                child: const Text(
                                  'Sing out',
                                  style: TextStyle(fontSize: 14.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  //'New'タブ
                  fetchDataList('new', ref),
                  //'恋愛'タブ
                  fetchDataList('1', ref),
                  //'ファンタジー'タブ
                  fetchDataList('2', ref),
                  //'文学'タブ
                  fetchDataList('3', ref),
                  //'SF'タブ
                  fetchDataList('4', ref),
                  //'その他'タブ
                  fetchDataList('98', ref),
                  //'ノンジャンル'タブ
                  fetchDataList('99', ref),
                ],
              ),
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
      }),
    );
  }

  //各ジャンル（タブ）ごとにAPI取得結果を表示させるためにRiverpodの.family（引数に対して一意のインスタンスになるため）で表示している
  Widget fetchDataList(String keyword, WidgetRef ref) {
    final itemList = ref.watch(listenItemListProvider(keyword));
    // final genre = ListenItemGenre();
    final detailWebAccess = DetailWebAccess();

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: () async {
          //TODO:表示リストを引っ張って更新できるように実装したい。だけど.familyのプロバイダーを使っているのでうまくできない。
          // return ref.read(listenItemListProvider(keyword));
          return await Future.delayed(Duration(seconds: 2));
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return itemList.when(
              data: (data) {
                final item = data[index];
                return Card(
                  child: ListTile(
                    // leading: Text(genre.getGenre(item.biggenre ?? 0)),
                    title: Text(
                      item.title ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item.story ?? ''),
                    onTap: () => detailWebAccess.openUrl(item.ncode ?? ''),
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
    );
  }
}
