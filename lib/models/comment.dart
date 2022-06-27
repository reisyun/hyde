import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

/// Entity
@freezed
class Comment with _$Comment {
  const factory Comment({
    // 식별자
    required String id,

    // 미디어 관련
    required Media media,

    // 글쓴이 관련
    required Author author,

    // 시청 후 느낀 감정
    required int emotion,

    // 글 내용
    String? content,

    // 좋아요 누른 사용자
    List<Like>? likes,

    // 생성한 날짜
    DateTime? createdAt,

    // 수정한 날짜
    DateTime? editedAt,
  }) = _Comment;

  factory Comment.fromJson(json) => _$CommentFromJson(json);
}

/// Value-Object
@freezed
class Media with _$Media {
  const factory Media({
    // 미디어 식별
    required String id,

    // 미디어 제목
    required String title,

    // 미디어 이미지
    required String banner,
  }) = _Media;

  factory Media.fromJson(json) => _$MediaFromJson(json);
}

/// Value-Object
@freezed
class Author with _$Author {
  const factory Author({
    // 저자 식별
    required String id,

    // 저자 이름
    required String name,

    // 저자 이미지
    String? avatar,
  }) = _Author;

  factory Author.fromJson(json) => _$AuthorFromJson(json);
}

/// Value-Object
@freezed
class Like with _$Like {
  const factory Like({
    // 사용자 식별
    required String userId,

    // 좋아요 누른 날짜
    required DateTime createdAt,
  }) = _Like;

  factory Like.fromJson(json) => _$LikeFromJson(json);
}
