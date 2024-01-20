import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/helpers/formatter.dart';
import 'package:solo_trip_app/presentation/ui/country_detail.dart';
import 'package:solo_trip_app/presentation/widget/small_page_header.dart';

class FavoriteCountryScreen extends StatelessWidget {
  const FavoriteCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          SmallPageHeader(
            headerText: "Favorite Country",
            bodyText:
                "This page is list of all your favorite country that you save.",
          ),
          SizedBox(
            height: 24.0,
          ),
          ListOfCountry(),
        ],
      ),
    );
  }
}

class ListOfCountry extends StatefulWidget {
  const ListOfCountry({super.key});

  @override
  State<ListOfCountry> createState() => _ListOfCountryState();
}

class _ListOfCountryState extends State<ListOfCountry> {
  List favCountryList = [
    {
      "countryName": "Spain",
      "population": 47615034,
      "isFavorite": false,
      "region": "Europe",
      "backdrop_image": "spain_backdrop.jpg"
    },
    {
      "countryName": "New Zealand",
      "population": 5124100,
      "isFavorite": false,
      "region": "Oceania",
      "backdrop_image": "newzealand_backdrop.jpg"
    },
    {
      "countryName": "Portugal",
      "population": 10379007,
      "isFavorite": false,
      "region": "Europe",
      "backdrop_image": "portugal_backdrop.jpg"
    },
    {
      "countryName": "Australia",
      "population": 25978935,
      "isFavorite": false,
      "region": "Oceania",
      "backdrop_image": "sydney_backdrop.jpg"
    },
    {
      "countryName": "Ireland",
      "population": 5086988,
      "isFavorite": false,
      "region": "Europe",
      "backdrop_image": "ireland_backdrop.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      width: AppSize.deviceWidth(context),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: favCountryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CountryDetail(
                    country: favCountryList[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  bottom: (index == favCountryList.length - 1) ? 12.0 : 4.0),
              height: AppSize.deviceHeight(context) * .1,
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
                      tag: favCountryList[index]["backdrop_image"],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${favCountryList[index]["backdrop_image"]}"),
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
                                      favCountryList[index]["countryName"],
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
                                  color: secondaryDarkBackgroundColor,
                                  size: 20.0),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                Formatter.populationFormatter(
                                    favCountryList[index]["population"]),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
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
                                  color: secondaryDarkBackgroundColor,
                                  size: 20.0),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                favCountryList[index]["region"],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
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
        },
      ),
    );
  }
}
