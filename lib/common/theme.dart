import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryLightBackgroundColor,
    hintColor: darkGreyColor,
    textTheme: textTheme.apply(bodyColor: primaryDarkBackgroundColor),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: secondaryLightBackgroundColor,
      onBackground: primaryDarkBackgroundColor,
      onSurface: secondaryDarkBackgroundColor,
      error: dangerColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryLightBackgroundColor,
      ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: secondaryColor,
    scaffoldBackgroundColor: primaryDarkBackgroundColor,
    hintColor: darkGreyColor,
    textTheme: textTheme.apply(bodyColor: primaryLightBackgroundColor),
    colorScheme: ColorScheme.light(
      primary: secondaryColor,
      secondary: primaryColor,
      background: secondaryDarkBackgroundColor,
      onBackground: primaryLightBackgroundColor,
      onSurface: secondaryLightBackgroundColor,
      error: dangerColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
      ),
    ),
  );
}
