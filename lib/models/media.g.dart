// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      id: json['id'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      status: $enumDecode(_$MediaStatusEnumMap, json['status']),
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String?).toList(),
      title: json['title'] as String,
      synopsis: json['synopsis'] as String?,
      banner: json['banner'] as String,
      trailer: json['trailer'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type],
      'status': _$MediaStatusEnumMap[instance.status],
      'keywords': instance.keywords,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'banner': instance.banner,
      'trailer': instance.trailer,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

const _$MediaTypeEnumMap = {
  MediaType.TVA: 'TVA',
  MediaType.OVA: 'OVA',
  MediaType.MOVIE: 'MOVIE',
};

const _$MediaStatusEnumMap = {
  MediaStatus.FINISHED: 'FINISHED',
  MediaStatus.RELEASING: 'RELEASING',
  MediaStatus.UNRELEASED: 'UNRELEASED',
  MediaStatus.CANCELLED: 'CANCELLED',
  MediaStatus.HIATUS: 'HIATUS',
};

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String,
      author: json['author'] as String,
      emotion: json['emotion'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'emotion': instance.emotion,
      'content': instance.content,
    };
