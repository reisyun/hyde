import 'package:flutter/material.dart';
import 'package:hyde/widgets/atoms/text.dart';

class Info extends StatelessWidget {
  final String label;

  final Widget child;

  const Info({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(height: 8),
            HydeText(label),
          ],
        ),
      ),
    );
  }
}
