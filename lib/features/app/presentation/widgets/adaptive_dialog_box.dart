import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpt_app/core/localization/app_language.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/log_in_bloc.dart';
import 'package:jpt_app/main.dart';

void showAdaptiveDialogBox(BuildContext context) {
  return Platform.isIOS
      ? _showCupertinoAlertDialog(context)
      : _showMaterialSimpleDialog(context);
}

void _showCupertinoAlertDialog(BuildContext context) {
  showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(AppLocalizations.of(context).translate('signOutTitle')),
          content: Text(
            AppLocalizations.of(context).translate('signOutDescription'),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              child: Text(
                AppLocalizations.of(context).translate('signOutTitle'),
              ),
              onPressed: () {
                _signOutAndNavigateToLogInScreen(context);
              },
            ),
            CupertinoDialogAction(
              child: Text(
                AppLocalizations.of(context).translate('cancel'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

void _showMaterialSimpleDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('signOutTitle')),
          content: Text(
              AppLocalizations.of(context).translate('signOutDescription')),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                AppLocalizations.of(context).translate('cancel'),
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text(
                AppLocalizations.of(context).translate('signOutTitle'),
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                _signOutAndNavigateToLogInScreen(context);
              },
            ),
          ],
        );
      });
}

void _signOutAndNavigateToLogInScreen(BuildContext context) async {
  BlocProvider.of<LogInBloc>(blocContext).add(UserSignOut());
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => JptApp(appLanguage: appLanguage),
        fullscreenDialog: true,
      ),
      (_) => false);
}
