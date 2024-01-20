import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/common/text_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/helpers/app_size.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail({super.key});

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
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Center(
                        child: Icon(
                          CustomIcon.heartLine,
                          color: primaryColor,
                          size: 28.0,
                        ),
                      ),
                    ),
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
                tag: "",
                child: Container(
                  height: AppSize.deviceHeight(context) * .3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/indonesia_backdrop.jpg"),
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
                                  child: Image.asset("assets/flags/idn.png"),
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
                                      "1.000.000",
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
                                      "Jakarta",
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
                                      "Pacific",
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
                                        text:
                                            "A number of independent kingdoms united in 1492 to form the Kingdom of Spain, a cultural patchwork that continues to shape the modern nation’s dynamic identity. Spain comprises much of the Iberian Peninsula, which it shares with Portugal on the southwestern edge of Europe. It also includes the Balearic Islands in the Mediterranean Sea, the Canary Islands in the Atlantic Ocean and two enclaves in North Africa. A number of independent kingdoms united in 1492 to form the Kingdom of Spain, a cultural patchwork that continues to shape the modern nation’s dynamic identity. Spain comprises much of the Iberian Peninsula, which it shares with Portugal on the southwestern edge of Europe. It also includes the Balearic Islands in the Mediterranean Sea, the Canary Islands in the Atlantic Ocean and two enclaves in North Africa.",
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
