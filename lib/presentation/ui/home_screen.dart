import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/data/data_source/all_country_data.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/presentation/state/favorite_country_provider.dart';
import 'package:solo_trip_app/presentation/ui/country_detail.dart';
import 'package:solo_trip_app/presentation/widget/country_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Country> topCountryList = countryList;
    return SingleChildScrollView(
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
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryLightBackgroundColor,
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Image.asset(
                                "assets/images/Logo.png",
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Solo Trip App",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: primaryLightBackgroundColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor.withOpacity(.8),
                            padding: const EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/bell-solid.svg",
                            height: 24,
                            width: 24,
                            color: primaryLightBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: primaryLightBackgroundColor),
                      children: [
                        const TextSpan(text: "Welcome"),
                        TextSpan(
                            text: "\nIsmail Ahmad Kanabawi",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: primaryLightBackgroundColor))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Favorite",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: primaryColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<FavoriteCountryProvider>(
            builder: (BuildContext context, value, Widget? child) {
              if (value.favouriteCountries.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    "No Favorite Country",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: darkGreyColor,
                        ),
                  ),
                );
              }
              return SizedBox(
                height: 110,
                width: AppSize.deviceWidth(context),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: value.favouriteCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String imageHeroTag =
                        "${value.favouriteCountries[index].backdropImage} isFavorite";
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CountryDetail(
                              imageHeroTag: imageHeroTag,
                              country: value.favouriteCountries[index],
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imageHeroTag,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 32.0 : 4.0,
                            right:
                                (index == value.favouriteCountries.length - 1)
                                    ? 32.0
                                    : 4.0,
                          ),
                          width: AppSize.deviceWidth(context) * .6,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/${value.favouriteCountries[index].backdropImage}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: primaryGradient,
                                    backgroundBlendMode: BlendMode.softLight),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          value.favouriteCountries[index]
                                              .countryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                color:
                                                    primaryLightBackgroundColor,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          gradient: primaryGradient),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Top 5 Countries",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: primaryColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            width: AppSize.deviceWidth(context),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CountryCard(
                    country: topCountryList[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
