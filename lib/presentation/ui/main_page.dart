import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/presentation/ui/country_list_screen.dart';
import 'package:solo_trip_app/presentation/ui/favorite_country_screen.dart';
import 'package:solo_trip_app/presentation/ui/home_screen.dart';
import 'package:solo_trip_app/presentation/ui/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomeScreen(),
    CountryListScreen(),
    FavoriteCountryScreen(),
    ProfileScreen()
  ];

  int _currentIndexMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndexMenu],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryLightBackgroundColor,
          unselectedItemColor: darkGreyColor,
          backgroundColor: secondaryDarkBackgroundColor,
          unselectedFontSize: 12.0,
          selectedFontSize: 12.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndexMenu,
          onTap: (index) {
            setState(() {
              _currentIndexMenu = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 2,
                    width: 37,
                    decoration: BoxDecoration(
                      color: _currentIndexMenu == 0
                          ? primaryLightBackgroundColor
                          : secondaryDarkBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Icon(CustomIcon.homeLine),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 2,
                    width: 37,
                    decoration: BoxDecoration(
                      color: _currentIndexMenu == 1
                          ? primaryLightBackgroundColor
                          : secondaryDarkBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Icon(CustomIcon.flagLine),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 2,
                    width: 37,
                    decoration: BoxDecoration(
                      color: _currentIndexMenu == 2
                          ? primaryLightBackgroundColor
                          : secondaryDarkBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Icon(CustomIcon.heartLine),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 2,
                    width: 37,
                    decoration: BoxDecoration(
                      color: _currentIndexMenu == 3
                          ? primaryLightBackgroundColor
                          : secondaryDarkBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Icon(CustomIcon.userLine),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
              label: "Home",
            ),
          ]),
    );
  }
}
