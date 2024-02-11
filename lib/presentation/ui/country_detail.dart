import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/presentation/widget/app_bar_container.dart';

class CountryDetail extends StatelessWidget {
  final Country country;
  final String imageHeroTag;
  const CountryDetail({
    Key? key,
    required this.country,
    required this.imageHeroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBarContainer(
            withRightIcon: true,
            title: "Detail",
            country: country,
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Hero(
                tag: imageHeroTag,
                child: Container(
                  height: AppSize.deviceHeight(context) * .3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${country.backdropImage}"),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: primaryGradient,
                      backgroundBlendMode: BlendMode.softLight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: AppSize.deviceHeight(context) * .56,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                  color: primaryLightBackgroundColor,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(2, 2),
                                        color: Colors.black.withOpacity(.3),
                                        blurRadius: 8.0),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                      "assets/flags/${country.flag}"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      CustomIcon.usersSolid,
                                      size: 32.0,
                                      color: secondaryDarkBackgroundColor,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      country.population.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: secondaryDarkBackgroundColor,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      CustomIcon.buildingSolid,
                                      size: 32.0,
                                      color: secondaryDarkBackgroundColor,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      country.capital,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: secondaryDarkBackgroundColor,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      CustomIcon.poland,
                                      size: 32.0,
                                      color: secondaryDarkBackgroundColor,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      country.region,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: secondaryDarkBackgroundColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Overview \n",
                                        style: textTheme.headlineMedium!
                                            .copyWith(
                                                color:
                                                    primaryDarkBackgroundColor),
                                      ),
                                      TextSpan(
                                        text: country.overview,
                                        style: textTheme.bodySmall!.copyWith(
                                            color: primaryDarkBackgroundColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
