import 'package:get/get.dart';
import 'package:hyde/models/comment.dart';

class HistoryController extends GetxController {
  final histories = const <Comment>[].obs;

  void add(Comment comment) {
    // 동일한 미디어가 있는 지 확인
    final find = histories.where((_) => _.media.id == comment.media.id);

    // 미디어가 없다면 새롭게 추가
    if (find.isEmpty) {
      histories.add(comment);
    }
  }

  void remove({required String id}) {
    histories.removeWhere((item) => item.id == id);
  }
}
