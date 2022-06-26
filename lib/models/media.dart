import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

enum MediaType {
  TVA,
  OVA,
  MOVIE,
}

enum MediaStatus {
  // 완결
  FINISHED,

  // 방영 중
  RELEASING,

  // 미공개
  UNRELEASED,

  // 방영 취소
  CANCELLED,

  // 방영 중단
  HIATUS,
}

/// Entity
@freezed
class Media with _$Media {
  const factory Media({
    // 식별자
    required String id,

    // 미디어 타입
    required MediaType type,

    // 미디어 상태
    required MediaStatus status,

    // 태그 및 관련 정보
    required List<String?> keywords,

    // 미디어 제목
    required String title,

    // 미디어 개요
    String? synopsis,

    // 배너 이미지
    required String bannerImage,

    // 미리보기 영상
    String? trailer,

    // 시작 날짜
    DateTime? startDate,

    // 종료 날짜
    DateTime? endDate,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) {
    return _$MediaFromJson(json);
  }
}

/// Value-Object
@freezed
class Comment with _$Comment {
  const factory Comment({
    // 식별자
    required String id,

    // 저자 이름
    required String author,

    // 시청 후 느낀 감정
    required int emotion,

    // 글 내용
    required String content,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }
}
