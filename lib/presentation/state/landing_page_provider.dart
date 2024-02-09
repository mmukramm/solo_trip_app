import 'package:flutter/material.dart';

class LandingPageProvider extends ChangeNotifier {
  int currentPage = 0;
  MainAxisAlignment lineIndicatorAlignment = MainAxisAlignment.end;
  BorderRadius lineIndicatorBorderRadius = const BorderRadius.only(
    topRight: Radius.circular(20.0),
    bottomLeft: Radius.circular(20.0),
  );

  void lineIndicatorController() {
    if (currentPage == 0) {
      lineIndicatorAlignment = MainAxisAlignment.end;
      lineIndicatorBorderRadius = const BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      );
    }

    if (currentPage == 1) {
      lineIndicatorBorderRadius = const BorderRadius.vertical(
        top: Radius.circular(20),
      );
    }

    if (currentPage == 2) {
      lineIndicatorAlignment = MainAxisAlignment.start;
      lineIndicatorBorderRadius = const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      );
    }
    notifyListeners();
  }

  void changePage(int index) {
    currentPage = index;
    lineIndicatorController();
  }
}
