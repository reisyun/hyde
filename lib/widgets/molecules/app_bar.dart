import 'package:flutter/material.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/text.dart';

class HydeAppBar extends StatelessWidget {
  final String title;

  final Widget avatar;

  const HydeAppBar({
    required this.title,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: 240,
      flexibleSpace: _buildFlexibleSpace(title, avatar),
    );
  }

  Widget _buildFlexibleSpace(String title, Widget avatar) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      centerTitle: true,
      title: HydeText(
        title,
        size: FontSizes.title,
        color: FontColors.primary,
        strong: true,
      ),
      background: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [avatar],
      ),
    );
  }
}
