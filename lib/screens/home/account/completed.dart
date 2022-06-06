import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/widgets/molecules/progress_indicator_with_label.dart';
import 'package:hyde/widgets/organisms/library_field.dart';

class CompletedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double total = 500;
    const double value = 400;

    return LibraryField(
      name: '감상한',
      content: const ProgressIndicatorWithLabel(
        total: total,
        value: value,
        unitName: '개',
      ),
      onPressed: () => Get.toNamed('/@reisyun/completed'),
    );
  }
}
