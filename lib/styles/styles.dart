// styles.dart

import 'package:flutter/material.dart';

class Styles {
  static const Map<String, double> customFontSize = {
    'fontSize_14': 14.0,
    'fontSize_16': 16.0,
    'fontSize_18': 18.0,
    'fontSize_22': 22.0,
    'fontSize_24': 24.0,
    'fontSize_26': 26.47,
    'fontSize_32': 32.0,
  };

  static const Map<String, FontWeight> customFontWeight = {
    'fontWeight_400': FontWeight.w400,
    'fontWeight_600': FontWeight.w600,
    'fontWeight_500': FontWeight.w500,
    'fontWeight_700': FontWeight.w700,
  };

  static TextStyle customTextStyle(String fontSizeKey, String fontWeightKey,
      {Color color = Colors.black}) {
    return TextStyle(
        fontSize: customFontSize[fontSizeKey], // Use the font size from the map
        fontWeight: customFontWeight[fontWeightKey],
        color: color // Use the font weight from the map
        );
  }
}
