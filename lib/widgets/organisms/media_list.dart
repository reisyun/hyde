import 'package:flutter/material.dart';
import 'package:hyde/widgets/molecules/media_item.dart';

class MediaList extends StatelessWidget {
  final List<MediaItem> items;

  const MediaList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // styles
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(), // 드래그가 안되던 문제 해결

      // builder
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return MediaListItem(
          title: item.title,
          image: item.image,
          onPressed: item.onPressed,
        );
      },
    );
  }
}

/// Interface media item
class MediaItem {
  final String id;

  final String title;

  final String image;

  final VoidCallback? onPressed;

  const MediaItem({
    required this.id,
    required this.title,
    required this.image,
    this.onPressed,
  });
}
