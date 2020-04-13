import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen/settings_screen.dart';
import 'package:theme_provider/theme_provider.dart';

AppBar homeListAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context).translate('content'),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: FaIcon(FontAwesomeIcons.userCog),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsScreen(),
              fullscreenDialog: true,
            ),
          );
        },
      ),
    ],
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
      )),
    ),
  );
}
