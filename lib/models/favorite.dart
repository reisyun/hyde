import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

/// Entity
@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    // 식별자
    required String id,

    // 사용자 식별
    required String userId,

    // 미디어 식별
    required String mediaId,

    // 미디어 제목
    required String mediaTitle,

    // 미디어 이미지
    required String mediaBanner,

    // 추가한 날짜
    DateTime? addedAt,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return _$FavoriteFromJson(json);
  }
}
