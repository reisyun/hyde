import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/widgets/atoms/text.dart';

class MediaItem extends StatelessWidget {
  final String title;

  final String? image;

  final Widget? trailing;

  final VoidCallback? onPressed;

  const MediaItem({
    required this.title,
    this.image,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 16,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: HydeText(title, color: FontColors.primary),
      leading: _buildImage(image),
      trailing: trailing,
      onTap: onPressed,
    );
  }

  Widget _buildImage(String? source) {
    double size = 48;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        source ?? '',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
