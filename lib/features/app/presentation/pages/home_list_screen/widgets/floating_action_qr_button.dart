import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/features/app/presentation/pages/qr_code_scanner_screen/qr_code_scanner_screen.dart';
import 'package:theme_provider/theme_provider.dart';

Widget qrScannerButton(BuildContext context) {
  return FloatingActionButton(
    child: FaIcon(FontAwesomeIcons.qrcode),
    backgroundColor: ThemeProvider.themeOf(context)
        .data
        .floatingActionButtonTheme
        .foregroundColor,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QrScannerScreen(),
          fullscreenDialog: true,
        ),
      );
    },
  );
}
