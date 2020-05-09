import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_language.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/localization/supported_locales.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/domain/entities/list_view_items.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_dialog_box.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

List<ListViewItem> getSettingsMenuItemsList(BuildContext context) {
  return [_languageItem(context), _themeItem(context), _signOutItem(context)];
}

ListViewItem _languageItem(BuildContext context) {
  return ListViewItem(
    title: Text(
      AppLocalizations.of(context).translate('languages'),
      style: ThemeProvider.themeOf(context).data.textTheme.headline5,
    ),
    image: FaIcon(
      FontAwesomeIcons.globe,
      color: ThemeProvider.themeOf(context).data.iconTheme.color,
    ),
    children: [
      Column(
        children: _getLanguageWidgets(context),
      ),
    ],
  );
}

ListViewItem _themeItem(BuildContext context) {
  return ListViewItem(
    title: Text(
      AppLocalizations.of(context).translate('themes'),
      style: ThemeProvider.themeOf(context).data.textTheme.headline5,
    ),
    image: FaIcon(
      FontAwesomeIcons.palette,
      color: ThemeProvider.themeOf(context).data.iconTheme.color,
    ),
    children: [
      Column(
        children: _getThemeWidgets(context),
      ),
    ],
  );
}

ListViewItem _signOutItem(BuildContext context) {
  return ListViewItem(
    title: Text(
      AppLocalizations.of(context).translate('signOut'),
      style: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .headline5
          .copyWith(color: Colors.red),
    ),
    image: FaIcon(
      FontAwesomeIcons.signOutAlt,
      color: Colors.red,
    ),
    children: null,
    onTap: () {
      showAdaptiveDialogBox(context);
    },
  );
}

List<Widget> _getThemeWidgets(BuildContext context) {
  List<Widget> themeWidgets = [];
  for (var themeItem in myThemes) {
    final currentThemeOption = themeItem.options as GradientOptions;
    themeWidgets.add(
      ListTile(
        trailing: CheckMark.forThemes(themeItem: themeItem),
        onTap: () => ThemeProvider.controllerOf(context).setTheme(themeItem.id),
        title: Text(
          themeItem.name(context),
          style: ThemeProvider.themeOf(context).data.textTheme.headline5,
        ),
        leading: CircleAvatar(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  currentThemeOption.homeListScreenStartGradient,
                  currentThemeOption.homeListScreenEndGradient,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  return themeWidgets;
}

List<Widget> _getLanguageWidgets(BuildContext context) {
  var appLanguage = Provider.of<AppLanguage>(context);

  List<Widget> languageWidgets = [];
  for (var locale in supportedLocales) {
    languageWidgets.add(
      Container(
        child: ListTile(
          trailing: CheckMark.forLanguages(locale: locale),
          onTap: () => appLanguage.changeLanguage(Locale(locale.languageCode)),
          title: Text(
            locale.fullName,
            style: ThemeProvider.themeOf(context).data.textTheme.headline5,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Flags.getMiniFlag(locale.countryCode, 35, 35),
          ),
        ),
      ),
    );
  }
  return languageWidgets;
}

class CheckMark extends StatelessWidget {
  final AppTheme themeItem;
  final Locale locale;

  CheckMark.forThemes({@required this.themeItem, this.locale});

  CheckMark.forLanguages({@required this.locale, this.themeItem});

  @override
  Widget build(BuildContext context) {
    final checkMark = FaIcon(FontAwesomeIcons.check);
    if (themeItem != null) {
      if (themeItem.id == ThemeProvider.themeOf(context).id) {
        return checkMark;
      }
    }
    if (locale != null) {
      if (locale == AppLocalizations.of(context).locale) {
        return checkMark;
      }
    }
    return SizedBox.shrink();
  }
}
