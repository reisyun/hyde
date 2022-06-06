import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/constants/anilist.dart';
import 'package:hyde/widgets/organisms/media_list.dart';

class DiscoverScreen extends StatelessWidget {
  void _handleNavigateTo(String meidaId) {
    Get.toNamed('/document/$meidaId');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: MediaList(
            anilist
                .map((item) => MediaListItem(
                      id: item['id'],
                      title: item['title'],
                      image: item['image'],
                      onPressed: () => _handleNavigateTo(item['id']),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
