import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/molecules/field.dart';

class LibraryField extends StatelessWidget {
  final String name;

  final Widget? content;

  final VoidCallback? onPressed;

  const LibraryField({
    required this.name,
    this.content,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      margin: const EdgeInsets.only(top: 12),
      header: FieldHeader(
        title: HydeText(
          name,
          strong: true,
          size: FontSizes.subHeader,
          color: FontColors.primary,
        ),
        trailing: onPressed != null
            ? const HydeIcon(FlutterRemix.arrow_right_s_line)
            : null,
        onTap: onPressed,
      ),
      child: content,
    );
  }
}
