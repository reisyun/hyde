import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/history_controller.dart';
import 'package:hyde/widgets/molecules/field.dart';
import 'package:hyde/widgets/organisms/history_list.dart';
import 'package:hyde/widgets/templates/page_template.dart';

class CompletedScreen extends StatelessWidget {
  void _handleNavigateTo(String meidaId) {
    Get.toNamed('/document/$meidaId');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return PageTemplate(
      title: '감상한',
      contents: [
        Field(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: Obx(() => HistoryList(
                controller.histories
                    .map((item) => HistoryItem(
                          id: item.id,
                          subtitle: "2022년 6월",
                          emotion: "joy",
                          title: item.media.title,
                          image: item.media.banner,
                          review: "오늘은 무엇일까",
                          onPressed: () => _handleNavigateTo(item.media.id),
                        ))
                    .toList(),
              )),
        )
      ],
    );
  }
}
