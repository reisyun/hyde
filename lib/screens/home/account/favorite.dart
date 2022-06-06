import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/history_controller.dart';
import 'package:hyde/models/history.dart';
import 'package:hyde/widgets/organisms/library_field.dart';
import 'package:hyde/widgets/organisms/media_list.dart';

class FavoriteSection extends StatelessWidget {
  void _handleNavigateTo(String meidaId) {
    Get.toNamed('/document/$meidaId');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return LibraryField(
      name: '보고싶은',
      content: Obx(() => MediaList(
            controller.histories
                // [1] 감상한 상태가 아닌 미디어 가져오기
                .where((item) => item.status != HistoryStatus.COMPLETED)
                // [2] 그 미디어에서 2개만 가져오기
                .take(2)
                // [3] 그 미디어를 포맷에 맞게 생성하기
                .map((item) => MediaListItem(
                      id: item.mediaId,
                      title: item.title,
                      image: item.image!,
                      onPressed: () => _handleNavigateTo(item.mediaId),
                    ))
                .toList(),
          )),
      onPressed: () => Get.toNamed('/@reisyun/favorite'),
    );
  }
}
