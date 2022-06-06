import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/molecules/app_bar.dart';

class LibraryTemplate extends StatelessWidget {
  final String title;

  final Color color;

  final List<Widget> contents;

  const LibraryTemplate({
    required this.title,
    required this.color,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        HydeAppBar(
          title: title,
          avatar: _buildAvatar(color),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 16,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                color: BackgroundColors.dep1,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
            ),
            ...contents,
          ]),
        ),
      ]),
    );
  }

  Widget _buildAvatar(Color color, {double size = 120}) {
    final Widget circle = Transform.translate(
      offset: const Offset(60, 60),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.6),
        ),
      ),
    );

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: BackgroundColors.dep2,
      ),
      child: circle,
    );
  }
}
