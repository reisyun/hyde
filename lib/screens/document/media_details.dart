import 'package:flutter/material.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/molecules/field.dart';

class MediaDetailsItem {
  final String label;

  final String text;

  const MediaDetailsItem(this.label, this.text);
}

// ignore: must_be_immutable
class MediaDetailsSection extends StatelessWidget {
  final List<MediaDetailsItem> infos;

  final int _visibilityCount = 2;

  const MediaDetailsSection(this.infos);

  @override
  Widget build(BuildContext context) {
    List<MediaDetailsItem> visible = infos.sublist(0, _visibilityCount);
    List<MediaDetailsItem> hidden =
        infos.sublist(_visibilityCount, infos.length);

    return Field(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      header: const FieldHeader(
        title: HydeText(
          '상세 정보',
          size: FontSizes.subHeader,
          color: FontColors.primary,
          strong: true,
        ),
      ),
      collapsedContent: Column(
        children: hidden.map((item) => _buildDetailsItem(item)).toList(),
      ),
      child: Column(
        children: visible.map((item) => _buildDetailsItem(item)).toList(),
      ),
    );
  }

  // Details Item
  Widget _buildDetailsItem(MediaDetailsItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HydeText(item.label),
          HydeText(
            item.text,
            color: FontColors.primary,
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
