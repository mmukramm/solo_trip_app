// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:solo_trip_app/common/colors_theme.dart';

class LandingPageContent extends StatelessWidget {
  final String firstText;
  final TextStyle firstTextStyle;
  final String secondText;
  final TextStyle secondTextStyle;
  final String thirdText;
  final TextStyle thirdTextStyle;

  const LandingPageContent({
    Key? key,
    required this.firstText,
    required this.firstTextStyle,
    required this.secondText,
    required this.secondTextStyle,
    required this.thirdText,
    required this.thirdTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            firstText,
            style: firstTextStyle,
          ),
          Text(
            secondText,
            style: secondTextStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            thirdText,
            style: thirdTextStyle,
          ),
        ],
      ),
    );
  }
}
