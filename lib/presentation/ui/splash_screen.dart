import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/presentation/ui/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Logo.png",
              height: 48.0,
            ),
            const SizedBox(
              width: 24.0,
            ),
            Container(
              width: 2.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: primaryLightBackgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Solo Trip \n",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: primaryLightBackgroundColor,
                        ),
                  ),
                  TextSpan(
                    text: "App",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: primaryLightBackgroundColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LandingPage()));
    });
  }
}
