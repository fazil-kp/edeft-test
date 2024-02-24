import 'package:flutter/material.dart';

class Colour {
  static const green = Colors.green;
  static const handWaveColor = Color(0xFFEA9E15);
  static const firstPageTextFieldGreyBackground = Color(0xFFEFEFEF);
  static const firstPageBackground = Color(0xFFEEEEEE);
  static const toggleLightBackground = Color(0xFFF1F1F1);
  static const primaryColor = Color(0xFF00AFAD);
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // primary: Color.fromARGB(255, 240, 26, 11),
  primary: Color(0xFFC32434),
  onPrimary: Color.fromARGB(255, 255, 255, 255),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),
  secondary: Color(0xFF00286B),
  onSecondary: Color.fromARGB(255, 255, 255, 255),
  secondaryContainer: Color(0xFFB3EBFF),
  onSecondaryContainer: Color.fromARGB(255, 0, 0, 0),
  tertiary: Color.fromARGB(255, 96, 100, 100),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFFF7D8FF),
  onTertiaryContainer: Color.fromARGB(255, 0, 0, 0),
  background: Color.fromARGB(255, 245, 245, 245),
  onBackground: Color.fromARGB(255, 0, 0, 0),
  surface: Color.fromARGB(255, 230, 233, 232),
  onSurface: Color.fromARGB(255, 0, 0, 0),
  error: Color(0xFFEA1505),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color.fromARGB(255, 0, 0, 0),
  onSurfaceVariant: Color.fromARGB(255, 13, 131, 146),
  inversePrimary: Color(0xFF005FAF),
  inverseSurface: Color(0xFFE3E2E6),
  onInverseSurface: Color.fromARGB(255, 0, 0, 0),
  surfaceVariant: Color.fromARGB(37, 0, 0, 0),
  shadow: Color.fromARGB(255, 0, 0, 0),
  surfaceTint: Color(0xFFE3E2E6),
  outline: Color(0xFFE3E2E6),
  outlineVariant: Color.fromARGB(255, 76, 21, 238),
  scrim: Color(0x4D000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff0468be),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF004786),
  onPrimaryContainer: Color.fromARGB(255, 196, 195, 195),
  inversePrimary: Color(0xFF005FAF),
  secondary: Color(0xFF52A98A),
  onSecondary: Color.fromARGB(255, 36, 36, 36),
  secondaryContainer: Color(0xFF004E5F),
  onSecondaryContainer: Color(0xFFB3EBFF),
  tertiary: Color(0xFF1DB9DD),
  onTertiary: Color.fromARGB(255, 182, 181, 181),
  tertiaryContainer: Color(0xFF553F5D),
  onTertiaryContainer: Color(0xFFF7D8FF),
  background: Color(0xFF2A2D35),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF313640),
  onSurface: Color.fromARGB(255, 211, 196, 255),
  surfaceTint: Color(0xFFFFFFFF),
  error: Color(0xFFEA1505),
  onError: Color(0xFFE8E5E5),
  errorContainer: Color(0xFFFFB70A),
  onErrorContainer: Color(0xFFB00020),
  surfaceVariant: Color(0x26FFFFFF),
  onSurfaceVariant: Color(0xFFC3C6CF),
  inverseSurface: Color(0xFFE3E2E6),
  onInverseSurface: Color(0xFF1A1C1E),
  outline: Color(0x26FFFFFF),
  shadow: Color(0xFF000000),
);

extension ColorExt on Color {
  Color toVariant(int variantNumber) {
    Color color = this;
    int baseRed = color.red;
    int baseGreen = color.green;
    int baseBlue = color.blue;
    int targetRed = Colors.white.red;
    int targetGreen = Colors.white.green;
    int targetBlue = Colors.white.blue;

    int variantRed = baseRed + ((targetRed - baseRed) * variantNumber ~/ 100);
    int variantGreen = baseGreen + ((targetGreen - baseGreen) * variantNumber ~/ 100);
    int variantBlue = baseBlue + ((targetBlue - baseBlue) * variantNumber ~/ 100);

    return Color.fromRGBO(variantRed, variantGreen, variantBlue, 1);
  }
}


//color
class UiColor {
  static Color secondaryColor = UiColors.hexToColor("#089dde");
  static Color primaryColor = UiColors.hexToColor("#93c020");
  static Color greyColor =  const Color.fromARGB(255, 137, 190, 250);
  static Color darkGreyColor = UiColors.hexToColor("#BDBDBD");
  static Color extraDarkGreyColor = UiColors.hexToColor("#585959");
  static Color scaffoldBackgroundColor = UiColors.hexToColor("#F9FAFA");

  static Color primaryTextColor = UiColors.hexToColor("#000000");
  static Color secondaryTextColor = UiColors.hexToColor("#555555");

  // Error Color
  static Color errorColor = UiColors.hexToColor("#F95B5B");
  // Warning Color
  static Color warningColor = UiColors.hexToColor("#F3B71B");
  // Success Color
  static Color successColor = UiColors.hexToColor("#63C952");
  // OnError Color
  static Color onErrorColor = UiColors.hexToColor("#FFFFFF");
  // CardOnBackground Color
  static Color cardOnBackgroundColor = UiColors.hexToColor("#FFFFFF");
}

class UiColors {
  // Hex to Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  // Color to Hex
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  // Color to Hex with Alpha
  static String colorToHexWithAlpha(Color color) {
    return '#${color.value.toRadixString(16)}';
  }
}
