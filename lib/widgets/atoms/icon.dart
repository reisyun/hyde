import 'package:flutter/widgets.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

// Use remixicon
export 'package:flutter_remix/flutter_remix.dart';

class HydeIcon extends StatelessWidget {
  final IconData? icon;

  final double? size;

  final Color? color;

  const HydeIcon(
    this.icon, {
    this.size = IconSizes.medium,
    this.color = FontColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color);
  }
}
