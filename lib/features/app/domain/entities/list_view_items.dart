import 'package:flutter/material.dart';

class ListViewItem {
  Widget title;
  Widget image;
  Function onTap;
  List<Widget> children;

  ListViewItem({this.title, this.image, this.onTap, this.children});
}
