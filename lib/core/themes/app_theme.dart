import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testflutterclean/core/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      fontFamily: GoogleFonts.poppins().fontFamily);

  static final dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.secondary),
      fontFamily: GoogleFonts.poppins().fontFamily);
}
