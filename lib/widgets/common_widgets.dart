import 'package:flutter/material.dart';

Widget getText({
  required String data,
  required double fontSize,
  required Color color,
  required FontWeight weight,
  TextDecoration? decoration,
}) {
  return Text(
    data,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
      decoration: decoration,
    ),
  );
}
