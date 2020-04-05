import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen/widgets/settings_app_bar.dart';
import 'package:jpt_app/features/app/presentation/pages/settings_screen//widgets/settings_ist_view.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context),
      body: settingsListView(context),
    );
  }
}
