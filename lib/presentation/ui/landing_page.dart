// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List landingPageImage = [
    "first_pageview_image.jpg",
    "second_pageview_image.jpg",
    "third_pageview_image.jpg",
  ];
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        controller: _pageController,
        itemCount: landingPageImage.length,
        itemBuilder: (_, index) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/${landingPageImage[index]}",
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -.7),
                  end: Alignment(1, 1),
                  colors: const <Color>[
                    Color(0x00FFFFFF),
                    Color(0xFFEEEDFF),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, -6),
                            blurRadius: 8,
                            color: Color(0x13000000))
                      ],
                      color: primaryLightBackgroundColor),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                            child: Container(
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0)),
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Selamat Datang Di",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: darkGreyColor,
                                      ),
                                ),
                                Text(
                                  "Solo Trip App",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: primaryColor,
                                      ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Pilih negara-negara destinasi wisata kamu.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: darkGreyColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(12.0),
                                      fixedSize: Size(48, 48),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icons/caret-line-right.svg",
                                      height: 24,
                                      width: 24,
                                      color: primaryLightBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 54,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: primaryColor),
                                ),
                                Container(
                                  width: 54,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: primaryColor),
                                ),
                                Container(
                                  width: 54,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: primaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]);
        },
      ),
    );
  }
}