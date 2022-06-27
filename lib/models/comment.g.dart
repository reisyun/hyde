// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String,
      media: Media.fromJson(json['media']),
      author: Author.fromJson(json['author']),
      emotion: json['emotion'] as int,
      content: json['content'] as String?,
      likes: (json['likes'] as List<dynamic>?)
          ?.map((e) => Like.fromJson(e))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media': instance.media,
      'author': instance.author,
      'emotion': instance.emotion,
      'content': instance.content,
      'likes': instance.likes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'editedAt': instance.editedAt?.toIso8601String(),
    };

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      id: json['id'] as String,
      title: json['title'] as String,
      banner: json['banner'] as String,
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'banner': instance.banner,
    };

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
