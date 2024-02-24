import 'package:dine_in_dia/helpers/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


abstract class ThemeStyle {
  Brightness get brightness;
  final Typography _typography = Typography.material2021();
  final ThemeMode mode;
  ColorScheme get colorScheme;
  TextTheme get textTheme;
  ThemeStyle(
    this.mode,
  );
}

class LightThemStyle extends ThemeStyle {
  LightThemStyle() : super(ThemeMode.light);

  @override
  ColorScheme get colorScheme => lightColorScheme;

  @override
  TextTheme get textTheme =>
      _typography.englishLike.copyWithTextTheme(colorScheme: colorScheme);

  @override
  Brightness get brightness => Brightness.light;
}

class DarkThemeStyle extends ThemeStyle {
  @override
  ColorScheme get colorScheme => darkColorScheme;

  DarkThemeStyle() : super(ThemeMode.dark);

  @override
  TextTheme get textTheme =>
      _typography.englishLike.copyWithTextTheme(colorScheme: colorScheme);

  @override
  Brightness get brightness => Brightness.dark;
}

class AppTheme {
  static final Typography _typography = Typography.material2021();

  static ThemeData getThemeData(ThemeMode mode) {
    final data = mode == ThemeMode.light ? LightThemStyle() : DarkThemeStyle();
    return ThemeData(
      brightness: data.brightness,
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: data.colorScheme.primary,
        selectionColor: data.colorScheme.primary.withOpacity(0.5),
      ),
      dialogBackgroundColor: data.colorScheme.background,
      colorScheme: data.colorScheme,
      typography: _typography,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          iconSize: 30,
          foregroundColor: data.colorScheme.primary,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: data.colorScheme.onBackground, width: 2),
      ),
      iconTheme: IconThemeData(
        color: data.colorScheme.onBackground,
        size: 30,
      ),
      cardTheme: CardTheme(
        surfaceTintColor: data.colorScheme.surface,
        color: data.colorScheme.surface,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: data.colorScheme.background,
        collapsedBackgroundColor: data.colorScheme.background,
      ),
      elevatedButtonTheme: _buttonStyle(data.colorScheme, data.textTheme),
      outlinedButtonTheme: _outlineStyle(data.colorScheme, data.textTheme),
      cardColor: data.colorScheme.surface,
      listTileTheme: ListTileThemeData(
        tileColor: data.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return 5;
          }
          return 5;
        }),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return data.colorScheme.primary;
          }
          return data.colorScheme.primary;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: data.colorScheme.primary,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
        isDense: true,
        filled: true,
        fillColor: data.colorScheme.inversePrimary.withOpacity(0.1),
        errorStyle:
            data.textTheme.bodySmall?.copyWith(color: data.colorScheme.error),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.7,
            color: data.colorScheme.tertiary,
          ),
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIconColor: data.colorScheme.outline,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.7,
            color: data.colorScheme.tertiary,
          ),
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: data.textTheme.bodyMedium
            ?.copyWith(color: data.colorScheme.secondary),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.7,
            color: data.colorScheme.tertiary,
          ),
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: data.textTheme,
      dialogTheme: DialogTheme(
        backgroundColor: data.colorScheme.background,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentTextStyle: data.textTheme.bodySmall,
        titleTextStyle:
            data.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: data.colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
          thickness: 0.8, color: data.colorScheme.outline.withOpacity(.3)),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      scaffoldBackgroundColor: data.colorScheme.background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: data.colorScheme.background,
        selectedIconTheme:
            IconThemeData(color: data.colorScheme.secondary, size: 30),
        unselectedIconTheme:
            IconThemeData(color: data.colorScheme.outline, size: 25),
        selectedLabelStyle: const TextStyle(color: Colors.green),
        selectedItemColor: data.colorScheme.secondary,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        unselectedItemColor: data.colorScheme.outline,
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.red,
        indicatorColor: Colors.red,
      ),
    );
  }

  static ThemeData reverseThemeData(ThemeData data) {
    return data.copyWith(
      textTheme: data.textTheme
          .copyWithTextTheme(color: data.colorScheme.onSurfaceVariant),
      colorScheme: data.colorScheme.copyWith(
        background: data.colorScheme.surfaceVariant,
        onBackground: data.colorScheme.onSurfaceVariant,
      ),
      scaffoldBackgroundColor: data.colorScheme.surfaceVariant,
      inputDecorationTheme: data.inputDecorationTheme.copyWith(
        filled: true,
        // fillColor: data.colorScheme.background.toVariant(1600),
      ),
    );
  }

  static ThemeData gradientTheme(ThemeData data) {
    return data.copyWith(
      iconTheme: data.iconTheme.copyWith(color: data.colorScheme.onPrimary),
      textTheme:
          data.textTheme.copyWithTextTheme(color: data.colorScheme.onPrimary),
    );
  }

  static ElevatedButtonThemeData _buttonStyle(
      ColorScheme colorScheme, TextTheme textTheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        textStyle: textTheme.bodyMedium,
      ),
    );
  }

  static OutlinedButtonThemeData _outlineStyle(
      ColorScheme colorScheme, TextTheme textTheme) {
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.primary,
            width: 20,
            strokeAlign: 20,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}

extension CopyWithTextTheme on TextTheme {
  TextTheme copyWithTextTheme({Color? color, ColorScheme? colorScheme}) {
    final fontFamily = GoogleFonts.lato().fontFamily;
    return copyWith(
      bodySmall: bodySmall?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 12),
      bodyMedium: bodyMedium?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 13),
      bodyLarge: bodyLarge?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w800),
      displaySmall: displaySmall?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 30),
      displayMedium: displayMedium?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 38),
      displayLarge: displayLarge?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 48),
      headlineSmall: headlineSmall?.copyWith(
          color: colorScheme?.primary ?? color,
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16),
      headlineMedium: headlineMedium?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 20),
      headlineLarge: headlineLarge?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 26),
      titleSmall: titleSmall?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 14),
      titleMedium: titleMedium?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 18),
      titleLarge: titleLarge?.copyWith(
          color: colorScheme?.onBackground ?? color,
          fontFamily: fontFamily,
          fontSize: 20),
      labelSmall: labelSmall?.copyWith(
          color: colorScheme?.outline ?? color,
          fontFamily: fontFamily,
          fontSize: 12),
      labelMedium: labelMedium?.copyWith(
          color: colorScheme?.outline ?? color,
          fontFamily: fontFamily,
          fontSize: 14),
      labelLarge: labelLarge?.copyWith(
          color: colorScheme?.outline ?? color,
          fontFamily: fontFamily,
          fontSize: 16),
    );
  }
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
