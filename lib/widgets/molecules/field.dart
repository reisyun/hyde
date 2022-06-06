import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/molecules/collapse.dart';

class Field extends StatelessWidget {
  final Widget? child;

  final Widget? header;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final BorderRadiusGeometry? borderRadius;

  final String? collapsedLabel;

  final Widget? collapsedContent;

  const Field({
    this.child,
    this.header,
    this.margin,
    this.padding,
    this.borderRadius,
    this.collapsedLabel,
    this.collapsedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: _getPadding(padding),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        color: BackgroundColors.dep1,
      ),
      child: Column(children: [
        header ?? const SizedBox(),
        child ?? const SizedBox(),
        if (collapsedContent != null)
          Collapse(
            label: collapsedLabel ?? '더보기',
            content: collapsedContent ?? const SizedBox(),
          ),
      ]),
    );
  }

  EdgeInsetsGeometry _getPadding(EdgeInsetsGeometry? pd) {
    EdgeInsetsGeometry? padding = const EdgeInsets.all(16);

    // If no collapse content, remove bottom padding
    if (collapsedContent != null) {
      padding = const EdgeInsets.fromLTRB(16, 16, 16, 0);
    }

    // Important
    if (pd != null) {
      padding = pd;
    }

    return padding;
  }
}

// [관심사 분리] 필드 해더에 공통적으로 필요한 속성들을 정의
class FieldHeader extends StatelessWidget {
  final Widget title;

  final Widget? subtitle;

  final Widget? leading;

  final Widget? trailing;

  final VoidCallback? onTap;

  const FieldHeader({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // styles
      dense: true,
      minLeadingWidth: 16,
      horizontalTitleGap: 8,
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: const EdgeInsets.only(bottom: 8),

      // data
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,

      // event
      onTap: onTap,
    );
  }
}
