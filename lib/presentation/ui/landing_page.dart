import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/presentation/state/landing_page_provider.dart';
import 'package:solo_trip_app/presentation/ui/main_page.dart';
import 'package:solo_trip_app/presentation/widget/landing_page_content.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> landingPageImage = [
    "first_pageview_image.jpg",
    "second_pageview_image.jpg",
    "third_pageview_image.jpg",
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingPageProvider>(
      builder:
          (BuildContext context, LandingPageProvider value, Widget? child) {
        return SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: landingPageImage.length,
                onPageChanged: (index) {
                  value.changePage(index);
                },
                itemBuilder: (_, index) {
                  return Stack(
                    children: [
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
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0, -.7),
                            end: Alignment(1, 1),
                            colors: <Color>[
                              Color(0x00FFFFFF),
                              Color(0xFFEEEDFF),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, -6),
                            blurRadius: 8,
                            color: Color(0x13000000))
                      ],
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: value.lineIndicatorAlignment,
                              children: [
                                AnimatedContainer(
                                  width: (value.currentPage == 0 ||
                                          value.currentPage == 2)
                                      ? MediaQuery.of(context).size.width / 2
                                      : MediaQuery.of(context).size.width,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        value.lineIndicatorBorderRadius,
                                    color: primaryColor,
                                  ),
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: (value.currentPage == 0) ? 1 : 0,
                                  duration: const Duration(milliseconds: 500),
                                  child: const FirstLandingPageContent(),
                                ),
                                AnimatedOpacity(
                                  opacity: (value.currentPage == 1) ? 1 : 0,
                                  duration: const Duration(milliseconds: 500),
                                  child: const SecondLandingPageContent(),
                                ),
                                AnimatedOpacity(
                                  opacity: (value.currentPage == 2) ? 1 : 0,
                                  duration: const Duration(milliseconds: 500),
                                  child: const ThirdLandingPageContent(),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, bottom: 32),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Visibility(
                                        visible: (value.currentPage == 1 ||
                                            value.currentPage == 2),
                                        child: SizedBox(
                                          width: 48,
                                          height: 48,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              value.currentPage > 0
                                                  ? value.currentPage--
                                                  : 0;
                                              _pageController.animateToPage(
                                                value.currentPage,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeIn,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              fixedSize: const Size(48, 48),
                                              backgroundColor:
                                                  secondaryLightBackgroundColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/icons/caret-line-left.svg",
                                              height: 24,
                                              width: 24,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: (value.currentPage == 0 ||
                                            value.currentPage == 1),
                                        child: SizedBox(
                                          width: 48,
                                          height: 48,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              value.currentPage < 2
                                                  ? value.currentPage++
                                                  : 2;
                                              _pageController.animateToPage(
                                                value.currentPage,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeIn,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              fixedSize: const Size(48, 48),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/icons/caret-line-right.svg",
                                              height: 24,
                                              width: 24,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: (value.currentPage == 2),
                                        child: SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainPage(),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context).primaryColor,
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            child: Text(
                                              "Mulai Menjelajah",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme.secondary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                    width: value.currentPage == 0 ? 32 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        color: value.currentPage == 0
                                            ? primaryColor
                                            : darkGreyColor),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: value.currentPage == 1 ? 32 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        color: value.currentPage == 1
                                            ? primaryColor
                                            : darkGreyColor),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: value.currentPage == 2 ? 32 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        color: value.currentPage == 2
                                            ? primaryColor
                                            : darkGreyColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
