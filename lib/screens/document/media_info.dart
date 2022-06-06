import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:hyde/styles/colors.dart';
import 'package:hyde/styles/sizes.dart';

import 'package:hyde/widgets/molecules/field.dart';

class MediaInfoSection extends StatelessWidget {
  final List<String>? tags;

  final String? synopsis;

  const MediaInfoSection({this.tags, this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Field(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(16),
      ),
      child: Column(
        children: [
          _buildTags(tags),
          const SizedBox(height: 16),
          _buildSynopsis(synopsis),
        ],
      ),
    );
  }

  Widget _buildTags(List<String>? tags) {
    if (tags == null) {
      return const SizedBox();
    }

    return Wrap(
      spacing: 12,
      children: tags.map((tag) => Chip(label: Text(tag))).toList(),
    );
  }

  Widget _buildSynopsis(String? synopsis) {
    if (synopsis == null) {
      return const SizedBox();
    }

    return ReadMoreText(
      synopsis,
      trimLines: 5,
      trimMode: TrimMode.Line,
      trimCollapsedText: '더보기',
      trimExpandedText: '',
      colorClickableText: FontColors.secondary,
      style: const TextStyle(
        height: 1.5,
        fontSize: FontSizes.body,
        color: FontColors.primary,
      ),
    );
  }
}
