import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/widgets/atoms/button.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/molecules/field.dart';

class CommentItem {
  final String username;

  final String text;

  const CommentItem(this.username, this.text);
}

class CommentSection extends StatelessWidget {
  final List<CommentItem> reviews;

  const CommentSection(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Field(
      header: FieldHeader(
        title: const HydeText(
          '한줄평',
          size: FontSizes.subHeader,
          color: FontColors.primary,
          strong: true,
        ),
        trailing: HydeButton(
          padding: EdgeInsets.zero,
          icon: FlutterRemix.arrow_right_s_line,
          onPressed: () => Get.toNamed('/document/123/comment'),
        ),
      ),
      child: Column(
        children: reviews.map((item) => _buildCommentItem(item)).toList(),
      ),
    );
  }

  // Comment Item
  Widget _buildCommentItem(CommentItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HydeText(item.username),
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
