import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/helpers/formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  List topCountryList = [
    {
      "countryName" : "Spain",
      "population" : 47615034,
      "isFavorite" : false,
      "region" : "Europe",
      "backdrop_image" : "spain_backdrop.jpg"
    },
    {
      "countryName" : "New Zealand",
      "population" : 5124100,
      "isFavorite" : false,
      "region" : "Oceania",
      "backdrop_image" : "newzealand_backdrop.jpg"
    },
    {
      "countryName" : "Portugal",
      "population" : 10379007,
      "isFavorite" : false,
      "region" : "Europe",
      "backdrop_image" : "portugal_backdrop.jpg"
    },
    {
      "countryName" : "Australia",
      "population" : 25978935,
      "isFavorite" : false,
      "region" : "Oceania",
      "backdrop_image" : "sydney_backdrop.jpg"
    },
    {
      "countryName" : "Ireland",
      "population" : 5086988,
      "isFavorite" : false,
      "region" : "Europe",
      "backdrop_image" : "ireland_backdrop.jpg"
    },
  ];

  List favCountryList = [
    {
      "countryName" : "Spain",
      "population" : 47615034,
      "isFavorite" : true,
      "region" : "Europe",
      "backdrop_image" : "spain_backdrop.jpg"
    },
    {
      "countryName" : "New Zealand",
      "population" : 5124100,
      "isFavorite" : true,
      "region" : "Oceania",
      "backdrop_image" : "newzealand_backdrop.jpg"
    },
    {
      "countryName" : "Portugal",
      "population" : 10379007,
      "isFavorite" : true,
      "region" : "Europe",
      "backdrop_image" : "portugal_backdrop.jpg"
    },
    {
      "countryName" : "Australia",
      "population" : 25978935,
      "isFavorite" : true,
      "region" : "Oceania",
      "backdrop_image" : "sydney_backdrop.jpg"
    },
    {
      "countryName" : "Ireland",
      "population" : 5086988,
      "isFavorite" : true,
      "region" : "Europe",
      "backdrop_image" : "ireland_backdrop.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(32.0),
              height: AppSize.deviceHeight(context) * .28,
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
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
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
            SizedBox(
              width: AppSize.deviceWidth(context),
              height: AppSize.deviceHeight(context) * .125,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: favCountryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: (index == 0) ? 32.0 : 4.0,
                      right: (index == favCountryList.length - 1) ? 32.0 : 4.0,
                    ),
                    width: AppSize.deviceWidth(context) * .6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/${favCountryList[index]["backdrop_image"]}",
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
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: primaryGradient,
                              backgroundBlendMode: BlendMode.softLight),
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    favCountryList[index]["countryName"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: primaryLightBackgroundColor,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 6,
                                decoration:
                                    BoxDecoration(gradient: primaryGradient),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
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
                  itemCount: topCountryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: (index == topCountryList.length - 1) ? 12.0 : 4.0),
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
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/${topCountryList[index]["backdrop_image"]}"),
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
                                  filter:
                                      ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    decoration: BoxDecoration(
                                      gradient: primaryGradient,
                                      backgroundBlendMode: BlendMode.softLight,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                          ),
                                          child: Text(
                                            topCountryList[index]["countryName"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color:
                                                      primaryLightBackgroundColor,
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
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                                        Formatter.populationFormatter(topCountryList[index]["population"]),
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
                                        topCountryList[index]["region"],
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
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
