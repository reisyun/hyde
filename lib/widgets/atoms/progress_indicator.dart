import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';

class HydeProgressIndicator extends StatelessWidget {
  final List<ProgressBar?> progressBarList;

  /// Multi line progress indicator
  const HydeProgressIndicator(this.progressBarList);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 12,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: CustomPaint(painter: ProgressBarPainter(progressBarList)),
    );
  }
}

/// ProgressBar Painter
class ProgressBarPainter extends CustomPainter {
  final Color trackColor;

  final List<ProgressBar?> progressBarList;

  const ProgressBarPainter(
    this.progressBarList, {
    this.trackColor = CommonColors.divider,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing stroke
    void drawBar({required Color color, double dx = 0, double width = 0}) {
      if (width <= 0.0) return;

      final double startPoint = dx * size.width;
      final double strokeLength = width * size.width;

      final Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..color = color;

      canvas.drawRect(
        Rect.fromLTWH(startPoint, 0, strokeLength, size.height),
        paint,
      );
    }

    // Paint track line
    drawBar(color: trackColor, width: size.width);

    // 좌표 x 누적값
    double accumulator = 0;
    for (var progressBar in progressBarList) {
      if (progressBar == null) return;

      // Paint progress bars
      drawBar(
        color: progressBar.color,
        width: progressBar.value,
        dx: accumulator,
      );

      accumulator += progressBar.value;
    }
  }

  @override
  bool shouldRepaint(ProgressBarPainter oldDelegate) {
    return oldDelegate.progressBarList != progressBarList;
  }
}

/// Interface
class ProgressBar {
  double value;

  Color color;

  ProgressBar({
    required this.value,
    required this.color,
  });
}
