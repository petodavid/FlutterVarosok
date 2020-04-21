import 'package:flutter/material.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:theme_provider/theme_provider.dart';

AppTheme orangeTheme() {
  return AppTheme(
    id: "orangetheme",
    description: "default light blue theme",
    options: GradientOptions(Color(0xfffcbb6d), Color(0xffd8737f),
        Color(0xffEB3349), Color(0xffF45C43)),
    data: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Color(0xffab6c82),
      ),
      iconTheme: IconThemeData(
        color: Color(0xffab6c82),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}
