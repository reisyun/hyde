import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/text.dart';

class HistoryListItem extends StatelessWidget {
  final String emotion;

  final String title;

  final String subtitle;

  const HistoryListItem({
    required this.emotion,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 8,
      leading: SvgPicture.asset(
        'assets/svgs/$emotion.svg',
        height: 40,
        semanticsLabel: emotion,
      ),
      title: HydeText(
        title,
        strong: true,
        maxLines: 1,
        color: FontColors.primary,
      ),
      subtitle: HydeText(
        subtitle,
        strong: true,
      ),
    );
  }
}

class HistoryCardItem extends StatelessWidget {
  final String emotion;

  final String title;

  final String subtitle;

  final String image;

  final String? review;

  final VoidCallback? onPressed;

  const HistoryCardItem({
    required this.emotion,
    required this.title,
    required this.subtitle,
    required this.image,
    this.review,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // titles
          HistoryListItem(
            emotion: emotion,
            title: title,
            subtitle: subtitle,
          ),

          // image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),

          // review
          review != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: HydeText(
                    review!,
                    height: 1.5,
                    maxLines: 5,
                    color: FontColors.primary,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
