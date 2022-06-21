import 'package:flutter/material.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/utils/fade_on_scroll.dart';
import 'package:hyde/widgets/atoms/text.dart';

class PageTemplate extends StatelessWidget {
  final String title;

  final List<Widget> contents;

  final ScrollController scrollController = ScrollController();

  PageTemplate({
    required this.title,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColors.dep1,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          // appbar
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: BackgroundColors.dep1,
            // Offset만큼 스크롤하면 title이 보여짐
            title: FadeOnScroll(
              scrollController: scrollController,
              startOffset: 48,
              child: _buildTitle(title, FontSizes.title),
            ),
          ),

          // contents
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(16),
                child: _buildTitle(title, FontSizes.display),
              ),
              ...contents,
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, double fontSize) {
    return HydeText(
      title,
      size: fontSize,
      color: FontColors.primary,
      strong: true,
    );
  }
}
