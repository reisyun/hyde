import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hyde/controllers/toggle_controller.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/button.dart';

class Collapse extends StatelessWidget {
  final String label;

  final Widget content;

  const Collapse({
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToggleController>(
      init: ToggleController(),
      builder: (c) => Column(children: [
        // collapsed 상태가 아니라면 컨텐츠를 표시
        if (c.state != false) content,
        _buildTrigger(c.state, c.onToggle)
      ]),
    );
  }

  Widget _buildTrigger(bool open, VoidCallback onOpenChange) {
    var title = open ? '접기' : label;
    var icon =
        open ? FlutterRemix.arrow_up_s_line : FlutterRemix.arrow_down_s_line;

    return HydeButton(
      gap: 4,
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
      title: title,
      icon: icon,
      onPressed: onOpenChange,
    );
  }
}
