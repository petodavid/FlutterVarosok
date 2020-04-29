import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen//widgets/settings_ist_view.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';
import 'package:theme_provider/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      appBar: appBarWithTitle(context, 'settings', true),
      body: settingsListView(context),
    );
  }
}
