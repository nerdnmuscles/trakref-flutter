import 'package:flutter/material.dart';
import 'package:trakref_app/routes.dart';

void main() => runApp(MyApp());

const kPrimaryColor = const Color(0xFF81c784);
const kPrimaryLight = const Color(0xFFb2fab4);
const kPrimaryDark = const Color(0xFF519657);
const kSecondaryColor = const Color(0xFF4dd0e1);
const kSecondaryLight = const Color(0xFF88ffff);
const kSecondaryDark = const Color(0xFF009faf);

class AppColors {
  static final gray = Color.fromRGBO(51, 51, 51, 1);
  static final lightGray = Color.fromRGBO(107, 114, 125, 1);
  static final blueTurquoise = Color.fromRGBO(48, 125, 140, 1);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      theme: buildTheme(),
      routes: routes,
    );
  }
}

ThemeData buildTheme() {
  final baseTheme = ThemeData(
    fontFamily: "SF Pro Text"
  );

  return baseTheme.copyWith(
    primaryColor: Color.fromRGBO(42, 45, 49, 1),
    primaryColorDark: kPrimaryDark,
    primaryColorLight: kPrimaryLight,
    textSelectionColor: Colors.red,
    accentColor: kSecondaryColor,
    bottomAppBarColor: kSecondaryDark,
    buttonColor: kSecondaryColor,
    sliderTheme: SliderThemeData.fromPrimaryColors(
      primaryColor: kPrimaryColor,
      primaryColorDark: kPrimaryDark,
      primaryColorLight: kPrimaryLight,
      valueIndicatorTextStyle: TextStyle(),
    ),
    textTheme: TextTheme().copyWith(
        subhead: TextStyle(
          color: AppColors.gray,
          decorationColor: AppColors.lightGray,
          fontFamily: "SF Pro Text Regular"
        )),
  );
}