import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/domain/entities/list_view_items.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_dialog_box.dart';

List<ListViewItem> getSettingsMenuItemsList(BuildContext context) {
  return [_languageItem(context), _themeItem(context), _signOutItem(context)];
}

ListViewItem _languageItem(BuildContext context) {
  return ListViewItem(
    title: Text(AppLocalizations.of(context).translate('languages')),
    image: FaIcon(
      FontAwesomeIcons.globe,
    ),
    children: [],
  );
}

ListViewItem _themeItem(BuildContext context) {
  return ListViewItem(
    title: Text(AppLocalizations.of(context).translate('themes')),
    image: FaIcon(
      FontAwesomeIcons.palette,
    ),
    children: [],
  );
}

ListViewItem _signOutItem(BuildContext context) {
  return ListViewItem(
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
    children: null,
    onTap: () {
      showAdaptiveDialobBox(context);
    },
  );
}
