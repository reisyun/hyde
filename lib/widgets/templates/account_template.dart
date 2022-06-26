import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/widgets/atoms/text.dart';

class AccountTemplate extends StatelessWidget {
  final String username;

  final String avatar;

  final List<Widget> contents;

  const AccountTemplate({
    required this.username,
    required this.avatar,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 240,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            flexibleSpace: _buildFlexibleSpace(
              username,
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(avatar),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(contents)),
        ],
      ),
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
