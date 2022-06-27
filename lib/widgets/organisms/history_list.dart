import 'package:flutter/material.dart';
import 'package:hyde/widgets/molecules/history_item.dart';

class HistoryList extends StatelessWidget {
  final List<HistoryItem> items;

  const HistoryList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // styles
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(), // 드래그가 안되던 문제 해결

      // builder
      itemCount: items.length,

      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return HistoryCardItem(
          emotion: item.emotion,
          title: item.title,
          subtitle: item.subtitle,
          image: item.image,
          review: item.review,
          onPressed: item.onPressed,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Divider(),
        );
      },
    );
  }
}

/// Interface history item
class HistoryItem {
  final String id;

  final String title;

  final String subtitle;

  final String emotion;

  final String image;

  final String? review;

  final VoidCallback? onPressed;

  const HistoryItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emotion,
    required this.image,
    this.review,
    this.onPressed,
  });
}
