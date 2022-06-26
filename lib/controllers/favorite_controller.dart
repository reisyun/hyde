import 'package:get/get.dart';
import 'package:hyde/models/favorite.dart';

class FavoriteController extends GetxController {
  // TODO: 테스팅 후 목업 제거하기
  final favorites = [
    const Favorite(
      id: '222',
      userId: 'reisyun',
      mediaId: '1',
      mediaTitle: '바이올렛 에버가든',
      mediaBanner: "https://bit.ly/33AxUGh",
    ),
  ].obs;

  void add(Favorite favorite) {
    // 동일한 미디어가 있는 지 확인
    final find = favorites.where((_) => _.mediaId == favorite.mediaId);

    // 미디어가 없다면 새롭게 추가
    if (find.isEmpty) {
      favorites.add(favorite);
    }
    // 미디어가 있다면 추가한 날짜 갱신
    // else if (find.isNotEmpty) {
    //   favorite.update();
    // }
  }

  void remove({required String id}) {
    favorites.removeWhere((item) => item.id == id);
  }
}
