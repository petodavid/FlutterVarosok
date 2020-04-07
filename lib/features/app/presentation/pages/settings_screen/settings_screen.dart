import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen//widgets/settings_ist_view.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'settings', true),
      body: settingsListView(context),
    );
  }
}
