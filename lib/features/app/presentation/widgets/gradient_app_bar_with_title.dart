import 'package:flutter/material.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';

AppBar appBarWithTitle(BuildContext context, String title,
    [bool localized = false]) {
  return AppBar(
    title: Text(
      localized ? AppLocalizations.of(context).translate(title) : title,
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
        ),
      ),
    ),
  );
}
