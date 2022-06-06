import 'package:flutter/material.dart';
import 'package:hyde/utils/show_bottom_sheet.dart';
import 'package:hyde/widgets/atoms/bottom_sheet.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/molecules/media_item.dart';

class MediaList extends StatelessWidget {
  final List<MediaListItem> items;

  final List<Widget> Function(String mediaId)? options;

  const MediaList(this.items, {this.options});

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
        return MediaItem(
          title: item.title,
          image: item.image,
          trailing: _buildOptions(item.id),
          onPressed: item.onPressed,
        );
      },
    );
  }

  /// 하단 시트에 아이템 선택
  Widget? _buildOptions(String id) {
    if (options == null) {
      return null;
    }

    return InkWell(
      onTap: () => showCustomBottomSheet(HydeBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: options!(id),
        ),
      )),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.centerRight,
        child: const HydeIcon(FlutterRemix.more_2_line),
      ),
    );
  }
}

/// Media List Item
class MediaListItem {
  final String id;

  final String title;

  final String image;

  final VoidCallback? onPressed;

  const MediaListItem({
    required this.id,
    required this.title,
    required this.image,
    this.onPressed,
  });
}
