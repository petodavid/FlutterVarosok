import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/constants/colors.dart';

Widget qrScannerButton() {
  return FloatingActionButton(
    child: FaIcon(FontAwesomeIcons.qrcode),
    backgroundColor: kHomeListScreenQrButton,
  );
}
