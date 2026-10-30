import 'package:flutter/material.dart';
import 'package:sf3/core/responsive.dart';

class StyelsMaanger {
  static const TextStyle whiteBold30 = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // responsive version
  static TextStyle title(BuildContext context) =>
      whiteBold30.copyWith(fontSize: context.sp(30));
}