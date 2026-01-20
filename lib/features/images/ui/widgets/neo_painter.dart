import 'package:flutter/material.dart';

class NeoPainter extends CustomPainter {
  final List<PainterNode> nodes;

  NeoPainter(this.nodes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final node in nodes) {
      final paint = Paint()
        ..color = node.color
        ..strokeWidth = node.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      for (var i = 0; i < node.path.length - 1; i++) {
        canvas.drawLine(node.path[i], node.path[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PainterNode {
  List<Offset> path;
  final Color color;
  final double strokeWidth;

  PainterNode(this.path, this.color, this.strokeWidth);
}
