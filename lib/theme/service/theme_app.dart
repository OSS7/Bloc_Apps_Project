import 'package:flutter/material.dart';

enum AppTheme {
  light("Light"),
  dark("Dark");

  final String name;
  const AppTheme(this.name);
}

final appThemeData = {
  AppTheme.light: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.orange,
      scaffoldBackgroundColor: Colors.white),
  AppTheme.dark: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green,
      scaffoldBackgroundColor: Colors.black.withOpacity(0.5)),
};
