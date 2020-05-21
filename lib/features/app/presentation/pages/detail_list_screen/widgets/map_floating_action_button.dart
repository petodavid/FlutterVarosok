import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/features/app/presentation/pages/map_screen/map_screen.dart';
import 'package:theme_provider/theme_provider.dart';

class MapFloatingActionButton extends StatelessWidget {
  final String cityName;

  MapFloatingActionButton({@required this.cityName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(
        FontAwesomeIcons.solidMap,
      ),
      backgroundColor: ThemeProvider.themeOf(context)
          .data
          .floatingActionButtonTheme
          .foregroundColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(cityName: cityName),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
