import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
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

extension AppThemeName on AppTheme {
  String name(BuildContext context) {
    switch (this.id) {
      case 'bluetheme':
        {
          return AppLocalizations.of(context).translate('strumpfBlue');
        }
        break;
      case 'darktheme':
        {
          return AppLocalizations.of(context).translate('pureDark');
        }
        break;
      case 'orangetheme':
        {
          return AppLocalizations.of(context).translate('justOrange');
        }
        break;
    }
    return '';
  }
}
