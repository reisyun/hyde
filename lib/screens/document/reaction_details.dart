import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyde/constants/reaction.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/button.dart';
import 'package:hyde/widgets/atoms/progress_indicator.dart';
import 'package:hyde/widgets/molecules/field.dart';

class ReacionDetailsItem {
  final String name;

  final int votes;

  const ReacionDetailsItem({
    required this.name,
    required this.votes,
  });
}

class ReactionDetailsSection extends StatelessWidget {
  final List<ReacionDetailsItem> items;

  const ReactionDetailsSection(this.items);

  @override
  Widget build(BuildContext context) {
    return Field(
      header: _buildHeader(items[0]),
      child: Column(children: [
        HydeProgressIndicator(
          _render<ProgressBar>(
            items: items,
            initialValue: ProgressBar(value: 0, color: Colors.transparent),
            callback: (ReacionDetailsItem item, double percent, Color color) {
              return ProgressBar(
                color: color,
                value: percent,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: _render<Widget>(
              items: items,
              initialValue: const SizedBox(),
              callback: (ReacionDetailsItem item, double percent, Color color) {
                return _buildDetailsItem(
                  color: color,
                  name: Reaction.name(item.name),
                  percent: percent * 100,
                );
              }),
        ),
      ]),
    );
  }

  String _getSourcePath(String filename) {
    return 'assets/svgs/$filename.svg';
  }

  /// colors만큼 위젯을 만듦.
  /// callback으로 위젯에서 필요한 인자를 건네줌
  List<T> _render<T>({
    required List<ReacionDetailsItem> items,
    required T initialValue,
    required T Function(ReacionDetailsItem, double, Color) callback,
  }) {
    List<Color> colors = [
      BrandColors.primary,
      FontColors.secondary,
    ];

    int maxIndicator = colors.length;
    int totalVote = items.fold(0, (t, e) => t + e.votes);

    return items.map((item) {
      // generate index number
      int index = items.indexOf(item);
      double percent = item.votes / totalVote;

      // 투표한 사람이 없는 경우
      if (percent.isNaN) {
        percent = 0;
      }

      // items 개수가 colors보다 많아지면 STOP
      if (index >= maxIndicator) {
        return initialValue;
      }

      return callback(item, percent, colors[index]);
    }).toList();
  }

  /// Header
  FieldHeader _buildHeader(ReacionDetailsItem primary) {
    String title = primary.votes != 0
        ? '${Reaction.name(primary.name)}에 가장 공감했어요'
        : '아직 감상한 사람이 없어요';

    return FieldHeader(
      leading: SvgPicture.asset(
        _getSourcePath(primary.name),
        semanticsLabel: primary.name,
        height: 32,
      ),
      title: HydeText(
        title,
        size: FontSizes.subHeader,
        color: FontColors.primary,
        strong: true,
      ),
      trailing: HydeButton(
        padding: EdgeInsets.zero,
        icon: FlutterRemix.arrow_right_s_line,
        onPressed: () => Get.toNamed('/document/123/reaction'),
      ),
    );
  }

  /// Details Item
  Widget _buildDetailsItem({
    required String name,
    required double percent,
    Color color = CommonColors.divider,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        HydeText(name, color: FontColors.primary),
        const Spacer(),
        HydeText('${percent.toInt()}%'),
      ]),
    );
  }
}
