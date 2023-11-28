import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'fonts.dart';

IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(color: kGrey900);
}

ThemeData buildLightTheme(
    [String fontFamily = 'Roboto', String fontHeader = 'Raleway']) {
  final base = ThemeData.light().copyWith(
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(120, 40),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );

  return base.copyWith(
    brightness: Brightness.light,
    cardColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      colorScheme: kColorScheme,
      textTheme: ButtonTextTheme.normal,
      buttonColor: kDarkBG,
    ),
    primaryColorLight: kLightBG,
    primaryIconTheme: customIconTheme(base.iconTheme),
    textTheme: buildTextTheme(base.textTheme, fontFamily, fontHeader),
    primaryTextTheme:
        buildTextTheme(base.primaryTextTheme, fontFamily, fontHeader),
    iconTheme: customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    primaryColor: Color(0xFF3498DB),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      filled:true,
      fillColor: Colors.white,
      errorBorder: InputBorder.none
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,

      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
        systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
    ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    dialogBackgroundColor: kLightBG,
    colorScheme: kColorScheme
        .copyWith(
          secondary: kLightAccent,
        )
        .copyWith(background: Colors.white)
        .copyWith(error: kErrorRed),
  );
}
