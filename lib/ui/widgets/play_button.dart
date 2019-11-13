


import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlayButton extends CustomPainter {

  Paint _paint;
  Paint _triangle;

  PlayButton() {
    _paint = Paint()
        ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.fill;

    _triangle = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    var radio = size.width / 2;
    var minusFifteenPercent = radio - (radio * 0.15);
    var thirtyPercent = radio * 0.30;

    canvas.drawCircle(Offset(size.width / 2, size.width / 2), size.width / 2, _paint);
    path.moveTo(minusFifteenPercent, radio - (thirtyPercent));
    path.lineTo(radio + (thirtyPercent), radio);
    path.lineTo(minusFifteenPercent, radio + (thirtyPercent));
    path.lineTo(minusFifteenPercent, radio - (thirtyPercent));

    canvas.drawPath(path, _triangle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}