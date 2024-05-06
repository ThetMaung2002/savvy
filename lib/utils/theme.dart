import 'package:flutter/material.dart';
import 'package:savvy/constants/theme_code.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: ThemeLight.light,
    background: ThemeLight.background,
    onBackground: ThemeLight.text,
    primary: ThemeLight.primary,
    onPrimary: ThemeLight.background,
    secondary: ThemeLight.secondary,
    onSecondary: ThemeLight.text,
    tertiary: ThemeLight.tertiary,
    onTertiary: ThemeLight.text,
    surface: ThemeLight.background,
    onSurface: ThemeLight.text,
    error: Brightness.light == Brightness.light
        ? ThemeLight.error
        : ThemeLight.errorLight,
    onError: Brightness.light == Brightness.light
        ? ThemeLight.errorTone
        : ThemeLight.errorText,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ThemeLight.background,
    foregroundColor: ThemeLight.text,
    centerTitle: true,
  ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: ThemeLight.indicatorColor,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: ThemeDark.dark,
    background: ThemeDark.background,
    onBackground: ThemeDark.text,
    primary: ThemeDark.primary,
    onPrimary: ThemeDark.background,
    secondary: ThemeDark.secondary,
    onSecondary: ThemeDark.text,
    tertiary: ThemeDark.tertiary,
    onTertiary: ThemeDark.text,
    surface: ThemeDark.background,
    onSurface: ThemeDark.text,
    error: Brightness.light == Brightness.light
        ? ThemeDark.error
        : ThemeDark.errorDark,
    onError: Brightness.light == Brightness.light
        ? ThemeDark.errorTone
        : ThemeDark.errorText,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ThemeDark.background,
    foregroundColor: ThemeDark.text,
    centerTitle: true,
  ),
);
