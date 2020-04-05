import 'package:flutter/material.dart';
import 'package:jpt_app/core/constants/colors.dart';

AppBar PdfOrGridScreenAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
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
