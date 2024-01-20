import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';
import 'package:solo_trip_app/presentation/ui/country_detail.dart';
import 'package:solo_trip_app/presentation/ui/landing_page.dart';
import 'package:solo_trip_app/presentation/ui/main_page.dart';

void main() {
  runApp(const SoloTripApp());
}

class SoloTripApp extends StatelessWidget {
  const SoloTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Solo Trip App",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        textTheme: textTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: secondaryColor,
          background: primaryLightBackgroundColor,
          onBackground: primaryColor,
          shadow: Colors.black,
          error: dangerColor
        ),
        scaffoldBackgroundColor: primaryLightBackgroundColor
      ),
      home: const CountryDetail(),
    );
  }
}