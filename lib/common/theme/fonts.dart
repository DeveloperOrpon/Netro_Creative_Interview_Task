import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextTheme buildTextTheme(
  TextTheme base,
  String? language, [
  String fontFamily = 'Roboto',
  String fontHeader = 'Raleway',
]) {
  return base
      .copyWith(
        displayLarge: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.displayLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.black
          ),
        ).copyWith(

            /// If using the custom font
            /// un-comment below and clone to other headline.., bodyText..
            // fontFamily: 'Your Custom Font',
            ),
        displayMedium: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.displayMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        displaySmall: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.displaySmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        headlineMedium: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.headlineMedium!.copyWith(fontWeight: FontWeight.w700,       fontSize: 18,),
        ),
        headlineSmall: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.headlineSmall!.copyWith(       fontSize: 16,fontWeight: FontWeight.bold),

        ),
        titleLarge: GoogleFonts.getFont(
          fontHeader,
          textStyle: base.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ).copyWith(
            fontSize: 18,fontWeight: FontWeight.bold
            ),
        bodySmall: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.bodySmall!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
        ),
        titleMedium: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.titleMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        titleSmall: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.titleSmall!.copyWith(
            fontSize: 14
          ),
        ),
        bodyLarge: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.bodyLarge!.copyWith(
            fontSize: 16
          ),
        ),
        bodyMedium: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.bodyMedium!.copyWith(
            fontSize: 18
          ),
        ),
        labelLarge: GoogleFonts.getFont(
          fontFamily,
          textStyle: base.labelLarge!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 20.0),
        ),
      )
      .apply(
        displayColor: Colors.black,
        bodyColor: kGrey900,
      );
}
