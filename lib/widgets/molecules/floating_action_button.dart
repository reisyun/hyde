import 'package:flutter/material.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/icon.dart';

class HydeFAB extends StatelessWidget {
  final IconData icon;

  final VoidCallback onPressed;

  const HydeFAB({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: BrandColors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      onPressed: onPressed,
      child: HydeIcon(
        icon,
        size: IconSizes.large,
        color: Colors.white,
      ),
    );
  }
}
