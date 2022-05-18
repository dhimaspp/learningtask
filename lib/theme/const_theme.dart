import 'package:flutter/material.dart';

// Colos that use in our app
const kSecondaryColor = Color(0xFFEC744D);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFFd2d5ff);
const kFillColor = Color(0xFFE8582A);
const kMaincolor = Color(0xFFE8582A);
// ignore: use_full_hex_values_for_flutter_colors
const kStartColor = Color(0xffFBE3DC);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(1, 5),
  blurRadius: 4,
  color: Colors.black26,
);

final themeTask = ThemeData(
  textTheme: const TextTheme(
      headline3: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w700),
      bodyText1: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w300),
      caption: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w200)),
  primaryColorDark: kMaincolor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorLight: kSecondaryColor,
  primaryColor: const Color(0xFF000000),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kMaincolor),
);

// class PPtheme with Diagnosticable{
// const TextTheme ({TextStyle dinProBold, TextStyle dinProMedium, TextStyle dinProRegular, TextStyle dinProLight,

// }): assert((dinProBold == null && dinProMedium == null && dinProRegular == null && dinProLight == null)); final TextStyle dinProBold; final TextStyle dinProMedium; final TextStyle dinProRegular; final TextStyle dinProLight; };

const textInputDecoration = InputDecoration(
    focusColor: kMaincolor,
    hoverColor: kSecondaryColor,
    suffixStyle: TextStyle(
        fontFamily: "Anodina",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    labelStyle: TextStyle(
        fontFamily: "Anodina",
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black));
