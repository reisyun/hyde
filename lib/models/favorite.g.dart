// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      mediaId: json['mediaId'] as String,
      mediaTitle: json['mediaTitle'] as String,
      mediaBanner: json['mediaBanner'] as String,
      addedAt: json['addedAt'] == null
          ? null
          : DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'mediaId': instance.mediaId,
      'mediaTitle': instance.mediaTitle,
      'mediaBanner': instance.mediaBanner,
      'addedAt': instance.addedAt?.toIso8601String(),
    };
