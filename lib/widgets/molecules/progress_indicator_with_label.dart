import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/widgets/atoms/progress_indicator.dart';
import 'package:hyde/widgets/atoms/text.dart';

class ProgressIndicatorWithLabel extends StatelessWidget {
  final double total;

  final double value;

  final String? unitName;

  const ProgressIndicatorWithLabel({
    required this.total,
    required this.value,
    this.unitName,
  });

  @override
  Widget build(BuildContext context) {
    double strokeLength = 0;

    if (value <= total) {
      strokeLength = value / total;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HydeProgressIndicator([
          ProgressBar(value: strokeLength, color: BrandColors.secondary),
        ]),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            HydeText(
              '${value.toInt()}',
              size: FontSizes.subHeader,
              color: FontColors.primary,
            ),
            HydeText(
              '/${total.toInt()}${unitName ?? ''}',
              size: FontSizes.caption,
            ),
          ],
        )
      ],
    );
  }
}
