import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/favorite_controller.dart';
import 'package:hyde/widgets/molecules/progress_indicator_with_label.dart';
import 'package:hyde/widgets/organisms/library_field.dart';
import 'package:hyde/widgets/organisms/media_list.dart';
import 'package:hyde/widgets/templates/account_template.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountTemplate(
      username: 'viichan',
      avatar: 'https://bit.ly/3HW7zSY',
      contents: [
        CompletedSection(),
        FavoriteSection(),
      ],
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
    final controller = Get.find<FavoriteController>();

    return LibraryField(
      name: '보고싶은',
      content: Obx(() => MediaList(
            controller.favorites
                .map((item) => MediaItem(
                      id: item.mediaId,
                      title: item.mediaTitle,
                      image: item.mediaBanner,
                      onPressed: () => _handleNavigateTo(item.mediaId),
                    ))
                .toList(),
          )),
    );
  }
}
