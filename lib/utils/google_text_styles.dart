import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleTextStyles {
  static TextStyle robotoIntroButton({Color? color}) => GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  static TextStyle robotoRegular({Color? color, FontWeight? fontWeight}) => GoogleFonts.roboto(color: color);
  static TextStyle robotoSmall({Color? color}) => GoogleFonts.roboto(fontSize: 12, color: color);
  static TextStyle robotoCondensedSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.robotoCondensed(fontSize: 14, color: color, fontWeight: fontWeight);
  static TextStyle robotoLabel({Color? color}) => GoogleFonts.roboto(fontSize: 13, color: color);
  static TextStyle robotoLabelBold({Color? color}) =>
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w700, color: color);
  static TextStyle dmSerifDisplayLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 28, color: color, fontWeight: fontWeight);
  static TextStyle dmSerifDisplayMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 20, color: color, fontWeight: fontWeight);
  static TextStyle dmSerifDisplayTitle({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 60, fontWeight: FontWeight.bold, color: color);
  static TextStyle dmSerifDisplayBold({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold, color: color);
  static TextStyle dmSerifDisplaySettingTitle({Color? color}) => GoogleFonts.dmSerifDisplay(fontSize: 23, color: color);
  static TextStyle dmSerifDisplayCardTitle({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 32, color: color);
  static TextStyle dmSerifDisplayAppTitle({Color? color}) => GoogleFonts.dmSerifDisplay(fontSize: 42, color: color);
  static TextStyle dmSerifDisplayProgress({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.w500, color: color);
  static TextStyle dmSerifDisplayHeader({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.w900, fontSize: 36, color: color);
  static TextStyle dmSerifDisplaySettingCardTitle({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 23, color: color);
  static TextStyle dmSerifDisplaySettingCardSubtitle({Color? color}) =>
      GoogleFonts.dmSerifDisplay(fontSize: 12, color: color);
  static TextStyle robotoWhite({Color? color}) => GoogleFonts.roboto(color: color ?? Colors.white);
  static TextStyle robotoGrey({Color? color}) => GoogleFonts.roboto(color: color ?? Colors.grey[800]);
}
