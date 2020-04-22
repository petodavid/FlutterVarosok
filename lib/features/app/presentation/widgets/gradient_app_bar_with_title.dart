import 'package:flutter/material.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:theme_provider/theme_provider.dart';

AppBar appBarWithTitle(BuildContext context, String title,
    [bool localized = false]) {
  return AppBar(
    title: Text(
      localized ? AppLocalizations.of(context).translate(title) : title,
      style: ThemeProvider.themeOf(context).data.textTheme.title.copyWith(
            color: Colors.white,
          ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeProvider.optionsOf<GradientOptions>(context)
                .homeListScreenStartGradient,
            ThemeProvider.optionsOf<GradientOptions>(context)
                .homeListScreenEndGradient,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}
