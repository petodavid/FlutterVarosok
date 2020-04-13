import 'package:flutter/material.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:theme_provider/theme_provider.dart';

AppTheme darkTheme() {
  return AppTheme(
    id: "darkpurpletheme",
    description: "default light blue theme",
    options: GradientOptions(Color(0xff262626), Color(0xff262626),
        Color(0xffEB3349), Color(0xffF45C43)),
    data: ThemeData(
      scaffoldBackgroundColor: Color(0xff4D4D4D),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Color(0xff262626),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
