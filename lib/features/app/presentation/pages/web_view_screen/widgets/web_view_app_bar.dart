import 'package:flutter/material.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';

AppBar webViewAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context).translate('webPage'),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [kHomeListScreenStartGradient, kHomeListScreenEndGradient],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
    ),
  );
}
