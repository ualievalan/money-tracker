import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Painted Google "G" logo.
///
/// Uses CustomPainter so there is no network dependency and
/// no asset file required — works offline and in every environment.
class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key, this.size = 24});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  static const _blue = Color(0xFF4285F4);
  static const _red = Color(0xFFEA4335);
  static const _yellow = Color(0xFFFBBC05);
  static const _green = Color(0xFF34A853);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;
    final stroke = r * 0.28;
    final half = stroke / 2;

    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r - half);
    final paint = Paint()
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    // Red arc (top-right to top-left, ~315°→45° CCW, i.e. 225° sweep CW from top)
    paint.color = _red;
    canvas.drawArc(rect, _deg(-220), _deg(145), false, paint);

    // Yellow arc (bottom-left, ~180°→225°)
    paint.color = _yellow;
    canvas.drawArc(rect, _deg(-75), _deg(75), false, paint);

    // Green arc (bottom-right, ~225°→315°)
    paint.color = _green;
    canvas.drawArc(rect, _deg(0), _deg(95), false, paint);

    // Blue arc (right side, including the horizontal bar area)
    paint.color = _blue;
    canvas.drawArc(rect, _deg(95), _deg(90), false, paint);

    // Blue horizontal bar of the "G"
    final barPaint = Paint()
      ..color = _blue
      ..style = PaintingStyle.fill;

    final barTop = cy - half;
    final barBottom = cy + half;
    final barLeft = cx;
    final barRight = size.width - half;
    canvas.drawRect(
      Rect.fromLTRB(barLeft, barTop, barRight, barBottom),
      barPaint,
    );

    // Small cap dot to close the right edge of the bar arc
    canvas.drawCircle(
      Offset(barRight, cy),
      half,
      barPaint,
    );
  }

  static double _deg(double degrees) => degrees * (math.pi / 180);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
