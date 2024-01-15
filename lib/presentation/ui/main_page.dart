import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndexMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Main Page"),
      ),
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
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: 2,
                    width: 37,
                    decoration: BoxDecoration(
                      color: _currentIndexMenu == 0 ? primaryLightBackgroundColor : secondaryDarkBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Icon(CustomIcon.homeLine),
                ],
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.flagLine),
              label: "Country List",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.heartLine),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.usersLine),
              label: "Profile",
            ),
          ]),
    );
  }
}
