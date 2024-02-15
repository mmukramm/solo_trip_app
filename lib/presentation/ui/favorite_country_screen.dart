import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/presentation/state/favorite_country_provider.dart';
import 'package:solo_trip_app/presentation/widget/country_card.dart';
import 'package:solo_trip_app/presentation/widget/small_page_header.dart';

class FavoriteCountryScreen extends StatelessWidget {
  const FavoriteCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SmallPageHeader(
            headerText: "Favorite Country",
            bodyText:
                "This page is list of all your favorite country that you save.",
          ),
          Consumer<FavoriteCountryProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return FutureBuilder(
                future: value.favouriteCountries,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: secondaryColor,
                        color: primaryColor,
                      ),
                    );
                  }
                  final List<Country> favouriteCountries = snapshot.data!;

                  if (favouriteCountries.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        SvgPicture.asset(
                          "assets/images/empty-illustration.svg",
                          height: 200,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Favorite Country is Empty",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: darkGreyColor,
                                  ),
                        ),
                      ],
                    );
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      shrinkWrap: true,
                      itemCount: favouriteCountries.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CountryCard(
                            country: favouriteCountries[index],
                            index: index,
                            isFavorite: true,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
