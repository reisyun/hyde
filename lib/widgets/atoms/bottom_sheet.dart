import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';

class HydeBottomSheet extends StatelessWidget {
  final Widget child;

  final Widget? submit;

  const HydeBottomSheet({
    required this.child,
    this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      color: BackgroundColors.dep1,
      child: SingleChildScrollView(
        child: Column(children: [
          _buildHeader(),
          child,
          submit ?? const SizedBox(),
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
