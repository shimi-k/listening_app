import 'package:listening_app/model/listen_item.dart';
import 'package:listening_app/view_model/common/toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'listen_item_list_provider.g.dart';

@riverpod
class ListenItemList extends _$ListenItemList {
  @override
  FutureOr<List<ListenItem>> build() async {
    return await _fetchData('new');
  }

  //初期化用APIデータの取得
  //プライベートの理由はbuild()内では内部的にguard()で実装されているらしいので外部用と分ける。意味あるのか。。？
  Future<List<ListenItem>> _fetchData(String order) async {
    final url =
        'https://api.syosetu.com/novelapi/api/?out=json&lim=10&of=t-s-n-bg-f-ah-ua&order=$order';
    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      final data = response.data as List;
      //取得したjsonデータの１つ目のリストは対象外のため削除しておく
      data.removeAt(0);
      final list = data.map((d) => ListenItem.fromJson(d)).toList();

      return list;
    } else {
      showToast(msg: 'API response error. error status:${response.statusCode}');
      return [];
    }
  }

  //外部用APIデータ取得
  // AsyncValue.guardに引き渡すのはプライベートのデート取得メソッド。Function()型の必要がある
  Future<void> fetchData(String order) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return _fetchData(order);
    });
  }

  Future<List<ListenItem>> _genreFilterFetchData(String genre) async {
    final url =
        'https://api.syosetu.com/novelapi/api/?out=json&lim=10&of=t-s-n-bg-f-ah-ua&biggenre=$genre';

    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      final data = response.data as List;
      //取得したjsonデータの１つ目のリストは対象外のため削除しておく
      data.removeAt(0);
      final list = data.map((d) => ListenItem.fromJson(d)).toList();

      return list;
    } else {
      showToast(msg: 'API response error. error status:${response.statusCode}');
      return [];
    }
  }

  //ジャンルでフィルターしてデータを取得する
  Future<void> filterFetchData(String genre) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return _genreFilterFetchData(genre);
    });
  }
}
