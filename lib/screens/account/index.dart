import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/models/history.dart';
import 'package:hyde/controllers/history_controller.dart';
import 'package:hyde/widgets/molecules/progress_indicator_with_label.dart';
import 'package:hyde/widgets/organisms/library_field.dart';
import 'package:hyde/widgets/organisms/media_list.dart';
import 'package:hyde/widgets/templates/account_template.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountTemplate(
      username: 'viichan',
      avatar: 'https://bit.ly/3LP3K2b',
      content: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          CompletedSection(),
          FavoriteSection(),
        ],
      ),
    );
  }
}

/// 시청한 미디어를 저장하는 공간
class CompletedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double total = 500;
    const double value = 400;

    return LibraryField(
      name: '감상한',
      content: const ProgressIndicatorWithLabel(
        total: total,
        value: value,
        unitName: '개',
      ),
      onPressed: () => Get.toNamed('/@reisyun/completed'),
    );
  }
}

/// 나중에 볼 미디어를 저장하는 공간
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
                // [1] 감상한 상태가 아닌 미디어를 가져옴
                .where((item) => item.status != HistoryStatus.COMPLETED)
                // [2] 그 미디어를 포맷에 맞게 생성
                .map((item) => MediaItem(
                      id: item.mediaId,
                      title: item.title,
                      image: item.image,
                      onPressed: () => _handleNavigateTo(item.mediaId),
                    ))
                .toList(),
          )),
    );
  }
}
