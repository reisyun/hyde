import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/text.dart';

class LibraryItem extends StatelessWidget {
  final String name;

  final String image;

  final VoidCallback? onPressed;

  const LibraryItem({
    required this.name,
    required this.image,
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
          Container(
            width: 120,
            height: 96,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: HydeText(name, maxLines: 2, color: FontColors.primary),
          )
        ],
      ),
    );
  }
}
