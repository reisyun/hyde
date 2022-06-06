import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/history_controller.dart';
import 'package:hyde/models/history.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/molecules/field.dart';
import 'package:hyde/widgets/organisms/media_list.dart';
import 'package:hyde/widgets/templates/library_template.dart';

class FavoriteScreen extends StatelessWidget {
  void _handleNavigateTo(String meidaId) {
    Get.toNamed('/document/$meidaId');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return LibraryTemplate(
      title: '보고싶은',
      color: CommonColors.point_pink,
      contents: [
        Field(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Obx(() => MediaList(
                controller.histories
                    .where((item) => item.status != HistoryStatus.COMPLETED)
                    .map((item) => MediaListItem(
                          id: item.id,
                          title: item.title,
                          image: item.image!,
                          onPressed: () => _handleNavigateTo(item.mediaId),
                        ))
                    .toList(),
                options: (String id) => [
                  ListTile(
                      minLeadingWidth: 24,
                      title: const HydeText(
                        '제거',
                        color: SystemColors.danger,
                      ),
                      leading: const HydeIcon(
                        FlutterRemix.delete_bin_7_line,
                        color: SystemColors.danger,
                      ),
                      onTap: () {
                        controller.remove(id: id);
                        Get.back();
                      }),
                ],
              )),
        ),
      ],
    );
  }
}
