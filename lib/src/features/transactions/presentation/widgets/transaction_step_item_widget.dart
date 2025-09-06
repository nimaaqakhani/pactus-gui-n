import 'package:flutter/material.dart';

class TransactionStepItemWidget {
  TransactionStepItemWidget(this.label, this.iconBuilder);

  final String label;
  final Widget Function(Color color) iconBuilder;
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2;

    const dashWidth = 3.0;
    const dashSpace = 3.0;

    final startX = 0.0;
    final endX = size.width;
    final centerY = size.height / 2 - 10;

    final totalLength = endX - startX;
    final dashCount = (totalLength / (dashWidth + dashSpace)).floor();
    final adjustedSpace =
        (totalLength - (dashCount * dashWidth)) / (dashCount - 1);

    var x = startX;
    for (var i = 0; i < dashCount; i++) {
      canvas.drawLine(
        Offset(x, centerY),
        Offset(x + dashWidth, centerY),
        paint,
      );
      x += dashWidth + adjustedSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
