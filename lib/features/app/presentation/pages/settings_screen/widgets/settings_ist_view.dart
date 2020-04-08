import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen/widgets/settings_menu_items.dart';

Widget settingsListView(BuildContext context) {
  final menuItems = getSettingsMenuItemsList(context);
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: menuItems.length,
    itemBuilder: (BuildContext context, int index) {
      if (menuItems[index].children == null) {
        return ListTile(
          title: menuItems[index].title,
          leading: menuItems[index].image,
          onTap: menuItems[index].onTap,
        );
      }
      return ExpansionTile(
        title: menuItems[index].title,
        leading: menuItems[index].image,
        children: menuItems[index].children,
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
