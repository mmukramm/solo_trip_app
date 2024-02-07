import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/presentation/state/favorite_country_provider.dart';

class CountryDetail extends StatefulWidget {
  final Country country;
  final String imageHeroTag;
  const CountryDetail({
    Key? key,
    required this.country,
    required this.imageHeroTag,
  }) : super(key: key);

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  late final ValueNotifier<bool> isFavorite;

  @override
  void initState() {
    isFavorite = ValueNotifier(context
        .read<FavoriteCountryProvider>()
        .favouriteCountries
        .contains(widget.country));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    isFavorite.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                  Text(
                    "Detail",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: primaryLightBackgroundColor),
                  ),
                  ValueListenableBuilder(
                    valueListenable: isFavorite,
                    builder: (context, value, child) {
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
                            !value
                                ? context
                                    .read<FavoriteCountryProvider>()
                                    .addToFavorite(widget.country)
                                : context
                                    .read<FavoriteCountryProvider>()
                                    .removeFromFavorite(widget.country);
                            isFavorite.value = context
                                .read<FavoriteCountryProvider>()
                                .favouriteCountries
                                .contains(widget.country);
                          },
                          child: Center(
                            child: Icon(
                              value
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
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Hero(
                tag: widget.imageHeroTag,
                child: Container(
                  height: AppSize.deviceHeight(context) * .3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${widget.country.backdropImage}"),
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
                                      "assets/flags/${widget.country.flag}"),
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
                                      widget.country.population.toString(),
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
                                      widget.country.capital,
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
                                      widget.country.region,
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
                                        text: widget.country.overview,
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
