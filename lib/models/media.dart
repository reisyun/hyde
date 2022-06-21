enum MediaStatus {
  FINISHED,
  RELEASING,
  UNRELEASED,
  CANCELLED,
  HIATUS,
}

class Media {
  static String getStatusName(MediaStatus status) {
    switch (status) {
      case MediaStatus.FINISHED:
        return '완결';
      case MediaStatus.RELEASING:
        return '방영중';
      case MediaStatus.UNRELEASED:
        return '미공개';
      case MediaStatus.CANCELLED:
        return '방영취소';
      case MediaStatus.HIATUS:
        return '중단';
    }
  }

  // 식별자
  final String id;

  // 작품 제목
  final String title;

  // 작품 타입 | TVA, MOVIE
  final String type;

  // 작품 상태 | 방영중, 방영종료
  final MediaStatus status;

  // 주요 태그
  final List<String?> tags;

  // 예고편
  final String? trailer;

  // 간략한 설명
  final String? synopsis;

  // 커버 이미지
  final String? coverImage;

  // 배너 이미지
  final String bannerImage;

  // 방영 날짜
  final DateTime? startDate;

  // 끝난 날짜
  final DateTime? endDate;

  const Media({
    required this.id,
    required this.title,
    required this.type,
    required this.status,
    required this.tags,
    this.trailer,
    this.synopsis,
    this.coverImage,
    required this.bannerImage,
    this.startDate,
    this.endDate,
  });
}
