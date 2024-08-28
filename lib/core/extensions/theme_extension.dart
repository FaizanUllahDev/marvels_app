import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  // height
  double get height => MediaQuery.sizeOf(this).height;
  // width
  double get width => MediaQuery.sizeOf(this).width;
}
