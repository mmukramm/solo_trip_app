// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/helpers/app_size.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Country List",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: primaryLightBackgroundColor,
                      ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Select the country to see the detail. You can save it so add it to your favorite country if you have interest to go that.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: primaryLightBackgroundColor,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: CustomTextField(),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 56.0,
            child: TextField(

              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryLightBackgroundColor,
                hintText: "Search Country",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              onPressed: () {},
              child: const Center(child: Icon(CustomIcon.searchLine)),
            ),
          ),
        ),
      ],
    );
  }
}
