import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';
import 'package:solo_trip_app/common/theme.dart';
import 'package:solo_trip_app/presentation/state/favorite_country_provider.dart';
import 'package:solo_trip_app/presentation/state/landing_page_provider.dart';
import 'package:solo_trip_app/presentation/state/theme_provider.dart';
import 'package:solo_trip_app/presentation/ui/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteCountryProvider()),
        ChangeNotifierProvider(create: (context) => LandingPageProvider()),
      ],
      child: const SoloTripApp(),
    ),
  );
}

class SoloTripApp extends StatelessWidget {
  const SoloTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Solo Trip App",
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: const SplashScreen(),
    );
  }
}
