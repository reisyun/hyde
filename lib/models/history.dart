enum HistoryStatus {
  COMPLETED,
  CURRENT,
  PLANNING,
}

class History {
  static String getStatusName(HistoryStatus status) {
    switch (status) {
      case HistoryStatus.COMPLETED:
        return '감상한';
      case HistoryStatus.CURRENT:
        return '감상중';
      case HistoryStatus.PLANNING:
        return '감상전';
    }
  }

  final String mediaId;

  final String id;

  final String title;

  final String? image;

  HistoryStatus status;

  final DateTime createdAt;

  DateTime updatedAt;

  History({
    required this.mediaId,
    required this.id,
    required this.title,
    required this.status,
    this.image,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  void update() {
    updatedAt = DateTime.now();
  }

  void changeStatus(HistoryStatus status) {
    this.status = status;
    update();
  }
}
