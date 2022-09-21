import 'package:flutter/material.dart';

class CustomDecoration {
  getDecoration({Color color = const Color(0xFFFFF7FF), double radius = 10, double border = 0, Color borderColor = const Color(0xFFFFF7FF),}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(width: border, color: borderColor),
    );
  }
}
