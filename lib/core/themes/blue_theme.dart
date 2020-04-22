import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

import 'theme_options.dart';

AppTheme blueTheme() {
  return AppTheme(
    id: "bluetheme",
    description: "default light blue theme",
    options: GradientOptions(Color(0xff00c6ff), Color(0xff0072ff),
        Color(0xffEB3349), Color(0xffF45C43)),
    data: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Color(0xff1abc9c),
      ),
      iconTheme: IconThemeData(
        color: Colors.blueAccent,
      ),
      textTheme: TextTheme(
        title: GoogleFonts.handlee(
          color: Colors.black,
        ),
      ),
    ),
  );
}
