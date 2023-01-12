import 'package:flutter/material.dart';

ThemeData squadTheme({
  bool isDarkMode = false,
}) {
  return ThemeData(
      useMaterial3: true,
      applyElevationOverlayColor: true,
      scaffoldBackgroundColor: Colors.blueGrey.shade100);
}
