import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/presentation/state/favorite_country_provider.dart';

class AppBarContainer extends StatelessWidget {
  final Country? country;
  final String title;
  final bool withRightIcon;

  const AppBarContainer({
    super.key,
    this.country,
    required this.title,
    this.withRightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48.0,
                    width: 48.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: secondaryLightBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Icon(
                          CustomIcon.caretLineLeft,
                          color: primaryColor,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                  if (withRightIcon)
                    Consumer<FavoriteCountryProvider>(
                      builder: (context, value, child) {
                        // value.favoriteChecker(country);
                        return SizedBox(
                          height: 48.0,
                          width: 48.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              backgroundColor: secondaryLightBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              !value.favouriteCountries.contains(country)
                                  ? value.addToFavorite(country!)
                                  : value.removeFromFavorite(country!);
                            },
                            child: Center(
                              child: Icon(
                                value.favouriteCountries.contains(country)
                                    ? CustomIcon.heartSolid
                                    : CustomIcon.heartLine,
                                color: primaryColor,
                                size: 28.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: primaryLightBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
