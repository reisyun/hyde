import 'package:flutter/material.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/atoms/icon.dart';

enum ButtonSizes {
  SMALL,
  MEDIUM,
  LARGE,
  FULL,
}

// ignore: must_be_immutable
class HydeButton extends StatelessWidget {
  // data
  final String? title;
  final IconData? icon;

  // size
  final double? gap;
  final ButtonSizes? size;

  // color
  final Color? color;
  final Color? backgroundColor;

  // control
  final bool? reverse;
  final bool? disabled;

  // custom
  final EdgeInsets? padding;
  final ButtonStyle? style;

  // event
  final VoidCallback? onPressed;

  // local variable
  late double _verticalPadding;
  late double _horizontalPadding;
  late double _fontSize;
  late double _iconSize;

  /// The basis this button is TextButton.
  HydeButton({
    this.title,
    this.icon,
    this.gap = 0,
    this.size = ButtonSizes.MEDIUM,
    this.color = FontColors.secondary,
    this.backgroundColor,
    this.reverse = false,
    this.disabled = false,
    this.padding,
    this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    _setDimensionsBasedOnSize();
    var isFullSize = size == ButtonSizes.FULL;

    List<Widget> children = [
      _conditionalBuild(
        condition: icon is IconData,
        buildWidget: HydeIcon(icon, size: _iconSize, color: color),
      ),
      SizedBox(width: gap),
      _conditionalBuild(
        condition: title is String,
        buildWidget: HydeText(title, size: _fontSize, color: color),
      ),
    ];

    List<Widget> renderChildren =
        !reverse! ? children : children.reversed.toList();

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: _getButtonPadding(),
        backgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ).merge(style),
      onPressed: disabled! ? null : onPressed,
      child: Row(
        mainAxisSize: isFullSize ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: renderChildren,
      ),
    );
  }

  EdgeInsets _getButtonPadding() {
    if (padding != null) return padding!;

    return EdgeInsets.symmetric(
      vertical: _verticalPadding,
      horizontal: _horizontalPadding,
    );
  }

  /// 사이즈별 기본 스타일 셋업
  void _setDimensionsBasedOnSize() {
    switch (size!) {
      case ButtonSizes.SMALL:
        _verticalPadding = 8;
        _horizontalPadding = 12;
        _fontSize = FontSizes.caption;
        _iconSize = IconSizes.small;
        break;
      case ButtonSizes.MEDIUM:
        _verticalPadding = 10;
        _horizontalPadding = 16;
        _fontSize = FontSizes.body;
        _iconSize = IconSizes.medium;
        break;
      case ButtonSizes.LARGE:
        _verticalPadding = 12;
        _horizontalPadding = 20;
        _fontSize = FontSizes.subHeader;
        _iconSize = IconSizes.large;
        break;
      case ButtonSizes.FULL:
        _verticalPadding = 18;
        _horizontalPadding = 0;
        _fontSize = FontSizes.subHeader;
        _iconSize = IconSizes.large;
        break;
    }
  }

  /// When data exists, build widget.
  Widget _conditionalBuild({
    required bool condition,
    required Widget buildWidget,
    Widget? defaultWidget,
  }) {
    return condition ? buildWidget : defaultWidget ?? const SizedBox();
  }
}
