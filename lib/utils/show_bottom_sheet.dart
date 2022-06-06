import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/styles/colors.dart';

void showCustomBottomSheet(Widget bottomsheet) {
  Get.bottomSheet(
    bottomsheet,
    clipBehavior: Clip.hardEdge,
    backgroundColor: BackgroundColors.dep1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );
}
