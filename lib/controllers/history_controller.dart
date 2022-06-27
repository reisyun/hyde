import 'package:get/get.dart';
import 'package:hyde/models/comment.dart';
import 'package:hyde/utils/read_json.dart';

class HistoryController extends GetxController {
  final histories = const <Comment>[].obs;

  @override
  void onInit() async {
    const userId = 'u1';

    final data = await readJson('assets/data/comment.json');
    final find = data.where((i) => i['author']['id'] == userId);
    final comments = find.map((c) => Comment.fromJson(c));

    histories.addAll(comments);

    super.onInit();
  }

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
