import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/domain/entities/settings_screen_menu.dart';

Widget settingsListView(BuildContext context) {
  final languageItem = SettingsMenuItem(
      title: 'Valami',
      image: CircleAvatar(),
      children: [CircleAvatar(), CircleAvatar()]);
  final menuItems = [languageItem];
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: menuItems.length,
    itemBuilder: (BuildContext context, int index) {
      return ExpansionTile(
        title: Text(menuItems[index].title),
        leading: menuItems[index].image,
        children: menuItems[index].children,
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
