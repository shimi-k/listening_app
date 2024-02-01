// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listen_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListenItemImpl _$$ListenItemImplFromJson(Map<String, dynamic> json) =>
    _$ListenItemImpl(
      title: json['title'] as String?,
      story: json['story'] as String?,
      ncode: json['ncode'] as String?,
      biggenre: json['biggenre'] as int?,
      favNovelCnt: json['fav_novel_cnt'] as int?,
      allHyokaCnt: json['all_hyoka_cnt'] as int?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ListenItemImplToJson(_$ListenItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'story': instance.story,
      'ncode': instance.ncode,
      'biggenre': instance.biggenre,
      'fav_novel_cnt': instance.favNovelCnt,
      'all_hyoka_cnt': instance.allHyokaCnt,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
