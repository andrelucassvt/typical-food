import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ColorsApp {
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkPrimary = Color(0xFF1B1817);
  static const Color darkSecondary = Color(0xFF2D2D2D);
  static const linearGradientDark = LinearGradient(
    colors: [
      darkSecondary,
      darkPrimary,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
