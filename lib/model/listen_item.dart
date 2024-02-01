import 'package:freezed_annotation/freezed_annotation.dart';

part 'listen_item.freezed.dart';
part 'listen_item.g.dart';

@freezed
class ListenItem with _$ListenItem {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListenItem({
    String? title,
    String? story,
    String? ncode,
    int? biggenre,
    int? favNovelCnt,
    int? allHyokaCnt,
    DateTime? updatedAt,
  }) = _ListenItem;

  factory ListenItem.fromJson(Map<String, dynamic> json) =>
      _$ListenItemFromJson(json);
}
