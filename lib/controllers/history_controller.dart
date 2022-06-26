import 'package:get/get.dart';
import 'package:hyde/models/comment.dart';

class HistoryController extends GetxController {
  // TODO: 테스팅 후 목업 제거하기
  final histories = const [
    Comment(
      id: '111',
      emotion: 0,
      author: Author(id: 'reisyun', name: 'reisyun'),
      media: Media(
        id: '0',
        title: '스파이 패밀리',
        banner: "https://bit.ly/3zn69ij",
      ),
    ),
    Comment(
      id: '222',
      emotion: 2,
      author: Author(id: 'reisyun', name: 'reisyun'),
      media: Media(
        id: '1',
        title: '바이올렛 에버가든',
        banner: "https://bit.ly/33AxUGh",
      ),
    ),
    Comment(
      id: '333',
      emotion: 0,
      author: Author(id: 'reisyun', name: 'reisyun'),
      media: Media(
        id: '2',
        title: '3월의 라이온',
        banner: "https://bit.ly/3wWjMSv",
      ),
    ),
  ].obs;

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
