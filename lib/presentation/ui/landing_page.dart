// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/presentation/widget/first_landing_page_bottom_sheet.dart';
import 'package:solo_trip_app/presentation/widget/second_landing_page_bottom_sheet.dart';
import 'package:solo_trip_app/presentation/widget/third_landing_page_bottom_sheet.dart';

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

  int _currentPage = 0;

  List landingPageBottomSheet = [
    FirstLandingPageBottomSheet(),
    SecondLandingPageBottomSheet(),
    ThirdLandingPageBottomSheet(),
  ];

  late double lineIndicatorWidth;
  late MainAxisAlignment lineIndicatorAlignment;

  final PageController _pageController = PageController(initialPage: 0);

  void _lineIndicatorController() {
    print(_currentPage);
    if (_currentPage == 0) {
      lineIndicatorAlignment = MainAxisAlignment.end;
    }
    if (_currentPage == 2) {
      lineIndicatorAlignment = MainAxisAlignment.start;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _lineIndicatorController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _lineIndicatorController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: landingPageImage.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
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
              ]);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 320,
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
                      mainAxisAlignment: lineIndicatorAlignment,
                      children: [
                        AnimatedContainer(
                          width: (_currentPage == 0 || _currentPage == 2)
                              ? MediaQuery.of(context).size.width / 2
                              : MediaQuery.of(context).size.width,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0)),
                            color: primaryColor,
                          ),
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                    Container(),
                    const SizedBox(
                      height: 26,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Selamat Datang Di",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _currentPage > 0 ? _currentPage-- : 0;
                                    _pageController.animateToPage(
                                      _currentPage,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                    setState(() {
                                      _lineIndicatorController();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(12.0),
                                    fixedSize: Size(48, 48),
                                    backgroundColor:
                                        secondaryLightBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/caret-line-left.svg",
                                    height: 24,
                                    width: 24,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(12.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                  ),
                                  child: Text(
                                    "Mulai Menjelajah",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: primaryLightBackgroundColor),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _currentPage < 2 ? _currentPage++ : 2;
                                    _pageController.animateToPage(
                                      _currentPage,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                    setState(() {
                                      _lineIndicatorController();
                                    });
                                  },
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
                                width: _currentPage == 0 ? 32 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    color: _currentPage == 0 ? primaryColor : darkGreyColor),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: _currentPage == 1 ? 32 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    color: _currentPage == 1 ? primaryColor : darkGreyColor),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: _currentPage == 2 ? 32 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    color: _currentPage == 2 ? primaryColor : darkGreyColor),
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
  }
}
