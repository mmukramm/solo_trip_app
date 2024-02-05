import 'package:flutter/material.dart';
import 'package:solo_trip_app/data/data_source/all_country_data.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/presentation/widget/country_card.dart';
import 'package:solo_trip_app/presentation/widget/small_page_header.dart';

class FavoriteCountryScreen extends StatelessWidget {
  const FavoriteCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Country> countryItems = [
      countryList[0],
      countryList[1],
    ];
    return Column(
      children: [
        const SmallPageHeader(
          headerText: "Favorite Country",
          bodyText:
              "This page is list of all your favorite country that you save.",
        ),
        const SizedBox(
          height: 24.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: countryItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CountryCard(
                  country: countryItems[index],
                  index: index,
                  isFavorite: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
