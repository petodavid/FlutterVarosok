import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ItemDataList extends Equatable {
  final List<ItemData> dataList;
  ItemDataList({
    @required this.dataList,
  });

  @override
  List<Object> get props => [dataList];
}

class ItemData extends Equatable {
  final List<HtmlTag> htmlTags;
  final List<PdfLink> pdfLinks;
  final String title;

  ItemData({
    @required this.htmlTags,
    @required this.pdfLinks,
    @required this.title,
  });
  @override
  List<Object> get props => [htmlTags, pdfLinks, title];
}

class HtmlTag extends Equatable {
  final String html;
  final String title;

  HtmlTag({
    @required this.html,
    @required this.title,
  });

  @override
  List<Object> get props => [html, title];
}

class PdfLink extends Equatable {
  final String link;
  final String title;

  PdfLink({
    @required this.link,
    @required this.title,
  });
  @override
  List<Object> get props => [link, title];
}
