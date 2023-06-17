import 'package:flutter/material.dart';

regularStyle(double size, [
  Color? clr,
]) {
  return TextStyle(
    fontSize: size,
    color: clr,
    fontWeight: FontWeight.w400,
  );
}

boldStyle(double size, [
  Color? clr,
]) {
  return TextStyle(
    fontSize: size,
    color: clr,
    fontWeight: FontWeight.bold,
  );
}
