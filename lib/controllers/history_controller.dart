import 'package:get/get.dart';
import 'package:hyde/models/history.dart';

class HistoryController extends GetxController {
  // TODO: 테스팅 후 목업 제거하기
  final histories = <History>[
    History(
      mediaId: '0',
      id: '111',
      title: '스파이 패밀리',
      image: "https://bit.ly/3zn69ij",
      status: HistoryStatus.PLANNING,
    ),
    History(
      mediaId: '1',
      id: '222',
      title: '바이올렛 에버가든',
      image: "https://bit.ly/33AxUGh",
      status: HistoryStatus.PLANNING,
    ),
    History(
      mediaId: '2',
      id: '333',
      title: '3월의 라이온',
      image: "https://bit.ly/3wWjMSv",
      status: HistoryStatus.PLANNING,
    ),
  ].obs;

  void add(History history) {
    final find = histories
        // [1] 동일한 미디어가 있는 지 확인
        .where((_) => _.mediaId == history.mediaId)
        // [2] 그 미디어가 같은 상태인지 확인
        .where((_) => _.status == history.status);

    // 미디어가 없다면 새롭게 추가
    if (find.isEmpty) {
      histories.add(history);
    }
    // 미디어가 있다면 추가한 날짜 갱신
    else if (find.isNotEmpty) {
      history.update();
    }
  }

  void remove({required String id}) {
    histories.removeWhere((item) => item.id == id);
  }

  void changeStatus({
    required String id,
    required HistoryStatus status,
  }) {
    final find = histories.singleWhere((_) => _.id == id);
    find.changeStatus(status);
    histories.refresh();
  }
}
