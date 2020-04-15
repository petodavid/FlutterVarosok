import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
  final String id;

  ItemData({
    this.htmlTags,
    this.pdfLinks,
    this.title,
    this.id,
  });

  @override
  List<Object> get props => [htmlTags, pdfLinks, title, id];
}

class HtmlTag extends Equatable {
  final String html;
  final String title;

  HtmlTag({
    this.html,
    this.title,
  });

  @override
  List<Object> get props => [html, title];
}

class PdfLink extends Equatable {
  final String link;
  final String title;

  PdfLink({
    this.link,
    this.title,
  });

  @override
  List<Object> get props => [link, title];
}
