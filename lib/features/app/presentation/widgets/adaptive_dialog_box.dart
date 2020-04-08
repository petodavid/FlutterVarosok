import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpt_app/core/auth/currest_user.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/presentation/pages/log_in_page/log_in_page_screen.dart';

void showAdaptiveDialobBox(BuildContext context) {
  return Platform.isIOS
      ? _showMaterialSimpleDialog(context)
      : _showMaterialSimpleDialog(context);
}

void _showCupertinoAlertDialog(BuildContext context) {
  showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
              'Allow "Maps" to access your location while you use the app?'),
          content: Text(
              'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Don\'t Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Allow'),
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
                CurrentUser().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        );
      });
}
