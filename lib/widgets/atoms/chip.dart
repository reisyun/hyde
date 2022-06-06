import 'package:flutter/material.dart';
import 'package:hyde/widgets/atoms/text.dart';

class HydeChip extends StatelessWidget {
  final String name;

  final Color? color;

  final EdgeInsetsGeometry? margin;

  const HydeChip({
    required this.name,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Chip(
        label: HydeText(
          name,
          strong: true,
          color: color,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
