import 'package:get/get.dart';
import 'package:hyde/models/favorite.dart';

class FavoriteController extends GetxController {
  final favorites = [
    const Favorite(
      id: '222',
      userId: 'reisyun',
      mediaId: '1',
      mediaTitle: '바이올렛 에버가든',
      mediaBanner: "https://bit.ly/33AxUGh",
    ),
  ].obs;

  // 동일한 미디어가 있는 지 확인
  Favorite? find({required String mediaId}) {
    return favorites.firstWhereOrNull((_) => _.mediaId == mediaId);
  }

  // If no media, favorite
  // If media exists, cancel favorite
  void toggle(Favorite favorite) {
    final item = find(mediaId: favorite.mediaId);

    if (item == null) {
      favorites.add(favorite);
    } else {
      favorites.remove(item);
    }
  }
}
