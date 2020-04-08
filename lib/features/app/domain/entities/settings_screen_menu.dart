import 'package:flutter/material.dart';

class SettingsMenuItem {
  Widget title;
  Widget image;
  Function onTap;
  List<Widget> children;

  SettingsMenuItem({this.title, this.image, this.onTap, this.children});
}
