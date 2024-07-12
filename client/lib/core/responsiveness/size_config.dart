import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  double hp(double percentage) {
    return screenHeight * (percentage / 100);
  }

  double wp(double percentage) {
    return screenWidth * (percentage / 100);
  }

  double sp(double percentage) {
    return screenWidth / 100 * (percentage / 3);
  }
}