import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/helpers/formatter.dart';
import 'package:solo_trip_app/presentation/ui/country_detail.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final int index;
  final bool? isFavorite;
  const CountryCard({
    super.key,
    required this.country,
    required this.index,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    String imageHeroTag = country.backdropImage + (isFavorite! ? " isFavorite" : "");
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CountryDetail(
              imageHeroTag: imageHeroTag,
              country: country,
            ),
          ),
        );
      },
      child: Container(
        height: 92,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(4.0, 4.0),
                blurRadius: 4.0,
                color: Colors.black.withOpacity(.15)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Hero(
                tag: imageHeroTag,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/${country.backdropImage}"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                          gradient: primaryGradient,
                          backgroundBlendMode: BlendMode.softLight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Text(
                                country.countryName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: primaryLightBackgroundColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: secondaryLightBackgroundColor,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(CustomIcon.usersSolid,
                            color: secondaryDarkBackgroundColor, size: 20.0),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          Formatter.populationFormatter(country.population),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: secondaryDarkBackgroundColor,
                                  ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(CustomIcon.poland,
                            color: secondaryDarkBackgroundColor, size: 20.0),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          country.region,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: secondaryDarkBackgroundColor,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
