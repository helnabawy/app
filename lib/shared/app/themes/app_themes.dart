part of '../app.imports.dart';

abstract class AppThemes {
  static const _lightFillColor = AppColors.black;
  static const _darkFillColor = Colors.white;
  static const double appBarHeight = 65;
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primary,
    primaryContainer: AppColors.bg,
    secondary: AppColors.secondary,
    secondaryContainer: AppColors.appBarColor,
    background: AppColors.bg,
    surface: AppColors.white,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: AppColors.primary,
    primaryContainer: Color(0xFF1CDEC9),
    secondary: AppColors.secondary,
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = const TextTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    backgroundColor: const Color.fromARGB(255, 250, 249, 243),
    scaffoldBackgroundColor: AppColors.white,
    focusColor: AppColors.primary,
    primaryColor: AppColors.primary,
    fontFamily: AppFontFamily.primary,
    colorScheme: const ColorScheme(
      onSurface: _lightFillColor,
      background: Colors.white,
      onBackground: Colors.white,
      shadow: Color.fromRGBO(224, 224, 224, 1),
      error: _lightFillColor,
      onError: _lightFillColor,
      onPrimary: _lightFillColor,
      onSecondary: AppColors.secondary,
      brightness: Brightness.light,
      surface: _lightFillColor,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.appBarColor),
    bottomAppBarColor: AppColors.appBarColor,
    textTheme: const TextTheme(
      subtitle1: TextStyle(fontFamily: AppFontFamily.primaryBold, fontSize: AppSizes.normal),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    backgroundColor: AppColors.blackOpacity,
    scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
    focusColor: AppColors.primary,
    primaryColor: AppColors.primary,
    fontFamily: AppFontFamily.primary,
    colorScheme: const ColorScheme(
      onSurface: _darkFillColor,
      shadow: Color.fromARGB(255, 62, 62, 62),
      background: Color.fromARGB(255, 24, 21, 32),
      onBackground: Color.fromARGB(255, 24, 21, 32),
      error: _darkFillColor,
      onError: _darkFillColor,
      onPrimary: _darkFillColor,
      onSecondary: AppColors.secondary,
      brightness: Brightness.dark,
      surface: _darkFillColor,
      primary: AppColors.primary,
      secondary: Color.fromARGB(255, 85, 141, 146),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
    bottomAppBarColor: AppColors.black,
    textTheme: const TextTheme(
      subtitle1: TextStyle(fontFamily: AppFontFamily.primaryBold, fontSize: AppSizes.normal),
    ),
  );
}

class AppSizes {
  static const double extraSmall = 10;
  static const double small = 12;
  static const double normal = 14;
  static const double large = 18;
  static const double extraLarge = 24;
}
