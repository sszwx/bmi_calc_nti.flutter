import 'package:flutter/material.dart';

extension ResponsiveX on BuildContext {
  Size get screen => MediaQuery.sizeOf(this);

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  // 390 = width of a "normal" phone. Smaller screens shrink things,
  // bigger ones grow them. clamp() keeps it from going crazy.
  double get scale => (screen.shortestSide / 390).clamp(0.8, 1.4);

  double sp(double size) => size * scale;
}