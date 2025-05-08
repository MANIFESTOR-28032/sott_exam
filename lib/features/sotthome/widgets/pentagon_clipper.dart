import 'package:flutter/material.dart';
import 'dart:math';

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    final double r = w / 2; // радиус описанной окружности
    final double centerX = w / 2;
    final double centerY = h / 2;

    final Path path = Path();

    // Строим пятиугольник по окружности
    for (int i = 0; i < 5; i++) {
      double angle = -pi / 2 + 2 * pi * i / 5; // старт сверху, по часовой
      double x = centerX + r * cos(angle);
      double y = centerY + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
