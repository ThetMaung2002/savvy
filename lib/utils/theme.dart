import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: Color(0xFFf7f9fd),
      onBackground: Color(0xFF04060b),
      primary: Color(0xFF4769cf),
      onPrimary: Color(0xFFf7f9fd),
      secondary: Color(0xFF889fe4),
      onSecondary: Color(0xFF04060b),
      tertiary: Color(0xFF6080e1),
      onTertiary: Color(0xFF04060b),
      surface: Color(0xFFf7f9fd),
      onSurface: Color(0xFF04060b),
      error: Brightness.light == Brightness.light
          ? Color(0xffB3261E)
          : Color(0xffF2B8B5),
      onError: Brightness.light == Brightness.light
          ? Color(0xffFFFFFF)
          : Color(0xff601410),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf7f9fd),
      foregroundColor: Color(0xFF04060b),
      centerTitle: true,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Color.fromRGBO(136, 159, 228, 0.4),
    ));

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: Color(0xFF061635),
    onBackground: Color(0xFFf4f6fb),
    primary: Color(0xFF2f51b6),
    onPrimary: Color(0xFFf4f6fb),
    secondary: Color(0xFF1b3379),
    onSecondary: Color(0xFFf4f6fb),
    tertiary: Color(0xFF1e3e9f),
    onTertiary: Color(0xFFf4f6fb),
    surface: Color(0xFF061635),
    onSurface: Color(0xFFf4f6fb),
    error: Brightness.dark == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.dark == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF061635),
    foregroundColor: Color(0xFFf4f6fb),
    centerTitle: true,
  ),
);
