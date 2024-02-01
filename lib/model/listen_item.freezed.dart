// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listen_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListenItem _$ListenItemFromJson(Map<String, dynamic> json) {
  return _ListenItem.fromJson(json);
}

/// @nodoc
mixin _$ListenItem {
  String? get title => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  String? get ncode => throw _privateConstructorUsedError;
  int? get biggenre => throw _privateConstructorUsedError;
  int? get favNovelCnt => throw _privateConstructorUsedError;
  int? get allHyokaCnt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListenItemCopyWith<ListenItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListenItemCopyWith<$Res> {
  factory $ListenItemCopyWith(
          ListenItem value, $Res Function(ListenItem) then) =
      _$ListenItemCopyWithImpl<$Res, ListenItem>;
  @useResult
  $Res call(
      {String? title,
      String? story,
      String? ncode,
      int? biggenre,
      int? favNovelCnt,
      int? allHyokaCnt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ListenItemCopyWithImpl<$Res, $Val extends ListenItem>
    implements $ListenItemCopyWith<$Res> {
  _$ListenItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? story = freezed,
    Object? ncode = freezed,
    Object? biggenre = freezed,
    Object? favNovelCnt = freezed,
    Object? allHyokaCnt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      ncode: freezed == ncode
          ? _value.ncode
          : ncode // ignore: cast_nullable_to_non_nullable
              as String?,
      biggenre: freezed == biggenre
          ? _value.biggenre
          : biggenre // ignore: cast_nullable_to_non_nullable
              as int?,
      favNovelCnt: freezed == favNovelCnt
          ? _value.favNovelCnt
          : favNovelCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      allHyokaCnt: freezed == allHyokaCnt
          ? _value.allHyokaCnt
          : allHyokaCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListenItemImplCopyWith<$Res>
    implements $ListenItemCopyWith<$Res> {
  factory _$$ListenItemImplCopyWith(
          _$ListenItemImpl value, $Res Function(_$ListenItemImpl) then) =
      __$$ListenItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? story,
      String? ncode,
      int? biggenre,
      int? favNovelCnt,
      int? allHyokaCnt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ListenItemImplCopyWithImpl<$Res>
    extends _$ListenItemCopyWithImpl<$Res, _$ListenItemImpl>
    implements _$$ListenItemImplCopyWith<$Res> {
  __$$ListenItemImplCopyWithImpl(
      _$ListenItemImpl _value, $Res Function(_$ListenItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? story = freezed,
    Object? ncode = freezed,
    Object? biggenre = freezed,
    Object? favNovelCnt = freezed,
    Object? allHyokaCnt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ListenItemImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      ncode: freezed == ncode
          ? _value.ncode
          : ncode // ignore: cast_nullable_to_non_nullable
              as String?,
      biggenre: freezed == biggenre
          ? _value.biggenre
          : biggenre // ignore: cast_nullable_to_non_nullable
              as int?,
      favNovelCnt: freezed == favNovelCnt
          ? _value.favNovelCnt
          : favNovelCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      allHyokaCnt: freezed == allHyokaCnt
          ? _value.allHyokaCnt
          : allHyokaCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ListenItemImpl implements _ListenItem {
  const _$ListenItemImpl(
      {this.title,
      this.story,
      this.ncode,
      this.biggenre,
      this.favNovelCnt,
      this.allHyokaCnt,
      this.updatedAt});

  factory _$ListenItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListenItemImplFromJson(json);

  @override
  final String? title;
  @override
  final String? story;
  @override
  final String? ncode;
  @override
  final int? biggenre;
  @override
  final int? favNovelCnt;
  @override
  final int? allHyokaCnt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ListenItem(title: $title, story: $story, ncode: $ncode, biggenre: $biggenre, favNovelCnt: $favNovelCnt, allHyokaCnt: $allHyokaCnt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.story, story) || other.story == story) &&
            (identical(other.ncode, ncode) || other.ncode == ncode) &&
            (identical(other.biggenre, biggenre) ||
                other.biggenre == biggenre) &&
            (identical(other.favNovelCnt, favNovelCnt) ||
                other.favNovelCnt == favNovelCnt) &&
            (identical(other.allHyokaCnt, allHyokaCnt) ||
                other.allHyokaCnt == allHyokaCnt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, story, ncode, biggenre,
      favNovelCnt, allHyokaCnt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenItemImplCopyWith<_$ListenItemImpl> get copyWith =>
      __$$ListenItemImplCopyWithImpl<_$ListenItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListenItemImplToJson(
      this,
    );
  }
}

abstract class _ListenItem implements ListenItem {
  const factory _ListenItem(
      {final String? title,
      final String? story,
      final String? ncode,
      final int? biggenre,
      final int? favNovelCnt,
      final int? allHyokaCnt,
      final DateTime? updatedAt}) = _$ListenItemImpl;

  factory _ListenItem.fromJson(Map<String, dynamic> json) =
      _$ListenItemImpl.fromJson;

  @override
  String? get title;
  @override
  String? get story;
  @override
  String? get ncode;
  @override
  int? get biggenre;
  @override
  int? get favNovelCnt;
  @override
  int? get allHyokaCnt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ListenItemImplCopyWith<_$ListenItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
