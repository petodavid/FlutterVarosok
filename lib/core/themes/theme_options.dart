import 'dart:ui';

import 'package:jpt_app/core/themes/blue_theme.dart';
import 'package:jpt_app/core/themes/dark_theme.dart';
import 'package:jpt_app/core/themes/orange_theme.dart';
import 'package:theme_provider/theme_provider.dart';

class GradientOptions implements AppThemeOptions {
  final Color homeListScreenStartGradient;
  final Color homeListScreenEndGradient;
  final Color flushBarExceptionGradientStart;
  final Color flushBarExceptionGradientEnd;

  GradientOptions(
      this.homeListScreenStartGradient,
      this.homeListScreenEndGradient,
      this.flushBarExceptionGradientStart,
      this.flushBarExceptionGradientEnd);
}

List<AppTheme> get myThemes => [blueTheme(), darkTheme(), orangeTheme()];
