import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const display = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );
  static const headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextTheme textTheme(Color color) {
    return TextTheme(
      displaySmall: display.copyWith(color: color),
      headlineMedium: headline.copyWith(color: color),
      titleLarge: title.copyWith(color: color),
      bodyLarge: bodyLarge.copyWith(color: color),
      bodyMedium: body.copyWith(color: color),
      labelLarge: bodyLarge.copyWith(color: color, fontWeight: FontWeight.w700),
      labelSmall: caption.copyWith(color: color),
    );
  }
}
