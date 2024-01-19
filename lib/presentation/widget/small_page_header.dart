// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:solo_trip_app/common/colors_theme.dart';

class SmallPageHeader extends StatelessWidget {
  final String headerText;
  final String bodyText;

  const SmallPageHeader({
    Key? key,
    required this.headerText,
    required this.bodyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
        gradient: primaryGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: primaryLightBackgroundColor,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            bodyText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: primaryLightBackgroundColor,
                ),
          ),
        ],
      ),
    );
  }
}
