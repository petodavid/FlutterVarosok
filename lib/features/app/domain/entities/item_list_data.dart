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

  ItemData({
    this.htmlTags,
    this.pdfLinks,
    this.title,
  });
  @override
  List<Object> get props => [htmlTags, pdfLinks, title];
}

class HtmlTag extends Equatable {
  final String id;
  final String html;
  final String title;

  HtmlTag({
    this.id,
    this.html,
    this.title,
  });

  @override
  List<Object> get props => [id, html, title];
}

class PdfLink extends Equatable {
  final String id;
  final String link;
  final String title;

  PdfLink({
    this.id,
    this.link,
    this.title,
  });

  @override
  List<Object> get props => [id, link, title];
}
