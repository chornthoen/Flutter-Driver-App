import 'package:flutter/material.dart';

abstract class AppColors {
  // primary color
  static const Color kPrimaryColor = Color(0xFF1CB666);

  /// The pale sky color.
  static const Color kColorGrey = Color(0xFF666666);

  /// The pale sky color grey200.
  static const Color kColorGrey200 = Color(0xFFCECECE);

  /// The input hover color.
  static const Color kColorWhite = Color(0xFFFFFFFF);

  // The color orange
  static const Color kColorOrange = Color(0xFFFF9900);

  // The color green
  static const Color kColorRed = Color(0xFFEB2227);

  // color light grey
  static const Color kColorLightGrey = Color(0xFFF2F4F5);

  // The color of the text
  static const Color tColor = Color(0xFF0D0140);

  static const Color kColorBlue = Color(0xFF130160);

  // The color of the text
  static const Color tColorGrey = Color(0xFF524B6B);

  // The color of the text
  static const Color tColorOrange = Color(0xFFFF9228);

  //515151
  static const Color bColorGrey = Color(0xFF8F9BB3);

  //darkTheme
  static const Color kColorDark = Color(0xFF212121);

  // The color of the text
  static const Color kColorBlack = Color(0xFF000000);

  /// The background color.
  static const Color kBackground = Color(0xFFF8FFFF);

  // apply to shadow

//99abc62e
  //box shadow

  static BoxShadow kBoxShadowColor = BoxShadow(
    color: kColorGrey.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 9,
    offset: const Offset(0, 9),
  );

  static Gradient kGradientColor = LinearGradient(
    colors: [
      const Color(0xFF009A2D).withOpacity(0.8),
      const Color(0xFF0D7226),
    ],
  );
  static BoxShadow kBoxShadowColor2 =  BoxShadow(
    color: AppColors.kPrimaryColor.withOpacity(0.09),
    blurRadius: 4,
    offset: Offset(0, 2),
  );
  static BoxShadow kBoxShadowColor1 =  BoxShadow(
    color: AppColors.kPrimaryColor.withOpacity(0.09),
    blurRadius: 4,
    offset: Offset(0, -2),
  );
}
