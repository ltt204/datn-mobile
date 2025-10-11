import 'package:flutter/material.dart';

class DashedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color dashColor;

  const DashedContainer({
    super.key,
    required this.child,
    this.borderRadius = 12,
    this.dashColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(radius: borderRadius, color: dashColor),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final double radius;
  final Color color;
  _DashedBorderPainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = color;

    const dash = 6.0;
    const gap = 4.0;

    final path = Path()..addRRect(rrect);
    for (final metric in path.computeMetrics()) {
      double dist = 0.0;
      while (dist < metric.length) {
        double end = (dist + dash).clamp(0, metric.length).toDouble();
        final extract = metric.extractPath(dist, end);
        canvas.drawPath(extract, paint);
        dist += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
