import 'package:client/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border(Color borderColor) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: borderColor,
          width: 3,
        ),
      );

  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    hintColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(22),
      focusedBorder: _border(AppPalette.gradient2),
      enabledBorder: _border(AppPalette.borderColor),
    ),
  );
}
