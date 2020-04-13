import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:theme_provider/theme_provider.dart';

class LocalNotificationFlushBar {
  BuildContext context;

  LocalNotificationFlushBar({@required this.context});

  void showInvalidPasswordException() {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      icon: Center(
          child: FaIcon(
        FontAwesomeIcons.lock,
        color: Colors.white,
      )),
      title: AppLocalizations.of(context).translate('invalidPassword'),
      message:
          AppLocalizations.of(context).translate('invalidPasswordDescription'),
      backgroundGradient: LinearGradient(colors: [
        ThemeProvider.optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientStart,
        ThemeProvider.optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientEnd,
      ]),
    )..show(context);
  }

  void showInvalidEmailException() {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      icon: Center(
          child: FaIcon(
        FontAwesomeIcons.solidEnvelope,
        color: Colors.white,
      )),
      title: AppLocalizations.of(context).translate('invalidEmail'),
      message:
          AppLocalizations.of(context).translate('invalidEmailDescription'),
      backgroundGradient: LinearGradient(colors: [
        ThemeProvider
            .optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientStart,
        ThemeProvider
            .optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientEnd,
      ]),
    )..show(context);
  }

  void showAuthException() {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      icon: Center(
          child: FaIcon(
        FontAwesomeIcons.server,
        color: Colors.white,
      )),
      title: AppLocalizations.of(context).translate('authException'),
      message:
          AppLocalizations.of(context).translate('authExceptionDescription'),
      backgroundGradient: LinearGradient(colors: [
        ThemeProvider
            .optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientStart,
        ThemeProvider
            .optionsOf<GradientOptions>(context)
            .flushBarExceptionGradientEnd,
      ]),
    )..show(context);
  }
}
