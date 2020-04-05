import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/domain/entities/settings_screen_menu.dart';

List<SettingsMenuItem> getSettingsMenuItemsList(BuildContext context) {
  return [_languageItem(context), _themeItem(context), _signOutItem(context)];
}

SettingsMenuItem _languageItem(BuildContext context) {
  return SettingsMenuItem(
    title: Text(AppLocalizations.of(context).translate('languages')),
    image: FaIcon(
      FontAwesomeIcons.globe,
    ),
    children: [],
  );
}

SettingsMenuItem _themeItem(BuildContext context) {
  return SettingsMenuItem(
    title: Text(AppLocalizations.of(context).translate('themes')),
    image: FaIcon(
      FontAwesomeIcons.palette,
    ),
    children: [],
  );
}

SettingsMenuItem _signOutItem(BuildContext context) {
  return SettingsMenuItem(
      title: Text(
        AppLocalizations.of(context).translate('signOut'),
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      image: FaIcon(
        FontAwesomeIcons.signOutAlt,
        color: Colors.red,
      ),
      children: null);
}
