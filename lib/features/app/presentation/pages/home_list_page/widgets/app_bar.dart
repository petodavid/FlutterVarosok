import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/constants/colors.dart';
import 'package:jpt_app/core/localization/app_localization.dart';

AppBar homeListAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context).translate('content'),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        child: FaIcon(FontAwesomeIcons.userCog),
      ),
    ],
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [kHomeListScreenStartGradient, kHomeListScreenEndGradient],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
    ),
  );
}
