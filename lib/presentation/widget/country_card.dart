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
  final VoidCallback? samplefunction;
  const CountryCard({
    super.key,
    required this.country,
    required this.index,
    this.isFavorite = false,
    this.samplefunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => CountryDetail(
              country: country,
            ),
          ),
        )
            .then(
          (value) {
            if (value) {
              if (samplefunction != null) {
                samplefunction!();
              }
            } else {
              null;
            }
          },
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 92,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4.0, 4.0),
              blurRadius: 4.0,
              color: Colors.black.withOpacity(.15),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Hero(
                tag: country.id,
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
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(CustomIcon.usersSolid,
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 20.0),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          Formatter.populationFormatter(country.population),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 20.0),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Flexible(
                          child: Text(
                            country.region,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 6,
              decoration: BoxDecoration(gradient: primaryGradient),
            )
          ],
        ),
      ),
    );
  }
}
