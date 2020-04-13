import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/domain/entities/list_view_items.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_dialog_box.dart';
import 'package:theme_provider/theme_provider.dart';

List<ListViewItem> getSettingsMenuItemsList(BuildContext context) {
  return [_languageItem(context), _themeItem(context), _signOutItem(context)];
}

ListViewItem _languageItem(BuildContext context) {
  return ListViewItem(
    title: Text(
      AppLocalizations.of(context).translate('languages'),
      style: ThemeProvider.themeOf(context).data.textTheme.title,
    ),
    image: FaIcon(
      FontAwesomeIcons.globe,
      color: ThemeProvider.themeOf(context).data.iconTheme.color,
    ),
    children: [],
  );
}

ListViewItem _themeItem(BuildContext context) {
  return ListViewItem(
    title: Text(
      AppLocalizations.of(context).translate('themes'),
      style: ThemeProvider
          .themeOf(context)
          .data
          .textTheme
          .title,
    ),
    image: FaIcon(
      FontAwesomeIcons.palette,
      color: ThemeProvider
          .themeOf(context)
          .data
          .iconTheme
          .color,
    ),
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _getThemeWidgets(context),
        ),
      ),
    ],
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

List<Widget> _getThemeWidgets(BuildContext context) {
  List<Widget> themeWidgets = [];
  for (var themeItem in myThemes) {
    final currentThemeOption = themeItem.options as GradientOptions;
    themeWidgets.add(
      Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            ThemeProvider.controllerOf(context).setTheme(themeItem.id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  currentThemeOption.homeListScreenStartGradient,
                  currentThemeOption.homeListScreenEndGradient,
                ],
              ),
            ),
            height: MediaQuery
                .of(context)
                .size
                .height / 6,
            width: 80,
          ),
        ),
      ),
    );
  }
  return themeWidgets;
}
