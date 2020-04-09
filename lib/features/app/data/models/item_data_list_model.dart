import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

ItemDataListModel itemDataListModelFromJson(String str) => ItemDataListModel(
    itemDataList: List<ItemDataModel>.from(
        json.decode(str).map((x) => ItemDataModel.fromJson(x))));

String itemDatalistModeToJson(ItemDataListModel data) =>
    json.encode(List<dynamic>.from(data.itemDataList.map((x) => x.toJson())));

class ItemDataListModel extends ItemDataList {
  final List<ItemDataModel> itemDataList;
  ItemDataListModel({@required this.itemDataList})
      : super(dataList: itemDataList);
}

class ItemDataModel extends ItemData {
  final List<HtmlTagModel> htmlTags;
  final List<PdfLinkModel> pdfLinks;
  final String title;
  ItemDataModel({
    this.htmlTags,
    this.pdfLinks,
    this.title,
  }) : super(htmlTags: htmlTags, pdfLinks: pdfLinks, title: title);

  factory ItemDataModel.fromJson(Map<String, dynamic> json) => ItemDataModel(
        htmlTags: json["htmlTags"] == null
            ? null
            : List<HtmlTagModel>.from(
                json["htmlTags"].map((x) => HtmlTagModel.fromJson(x))),
        pdfLinks: json["pdfLinks"] == null
            ? null
            : List<PdfLinkModel>.from(
                json["pdfLinks"].map((x) => PdfLinkModel.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "htmlTags": htmlTags == null
            ? null
            : List<dynamic>.from(htmlTags.map((x) => x.toJson())),
        "pdfLinks": pdfLinks == null
            ? null
            : List<dynamic>.from(pdfLinks.map((x) => x.toJson())),
        "title": title == null ? null : title,
      };
}

class HtmlTagModel extends HtmlTag {
  final String id;
  final String html;
  final String title;

  HtmlTagModel({
    this.id,
    this.html,
    this.title,
  }) : super(id: id, html: html, title: title);

  factory HtmlTagModel.fromJson(Map<String, dynamic> json) => HtmlTagModel(
        id: json["id"] == null ? null : json["id"],
        html: json["html"] == null ? null : json["html"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "html": html == null ? null : html,
        "title": title == null ? null : title,
      };
}

class PdfLinkModel extends PdfLink {
  final String id;
  final String link;
  final String title;

  PdfLinkModel({
    this.id,
    this.link,
    this.title,
  }) : super(id: id, link: link, title: title);

  factory PdfLinkModel.fromJson(Map<String, dynamic> json) => PdfLinkModel(
        id: json["id"] == null ? null : json["id"],
        link: json["link"] == null ? null : json["link"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "link": link == null ? null : link,
        "title": title == null ? null : title,
      };
}

extension RemoveEmptyDataLists on ItemDataListModel {
  void removeEmptyDataLists() {
    _removeEmptyOrNullTitleItems();
    _removeEmptyOrNullPdfAndWebIDArrays();
    _removeEmptyOrNullPdfLinkArrayTargetLinkItems();
    _removeEmptyOrNullHtmlTagsArrayHtmlItems();
    _removeEmptyOrNullPdfLinkAndHtmlTagArrays();
  }

  void _removeEmptyOrNullTitleItems() {
    this
        .dataList
        .removeWhere((item) =>
    item.title == null || item.title
        .trim()
        .isEmpty);
  }

  void _removeEmptyOrNullPdfAndWebIDArrays() {
    for (var item in this.dataList) {
      item.pdfLinks
          .removeWhere((item) =>
      item.id == null || item.id
          .trim()
          .isEmpty);
      item.htmlTags
          .removeWhere((item) =>
      item.id == null || item.id
          .trim()
          .isEmpty);
    }
  }

  void _removeEmptyOrNullPdfLinkArrayTargetLinkItems() {
    for (var item in this.dataList) {
      item.pdfLinks
          .removeWhere((item) =>
      item.link == null || item.link
          .trim()
          .isEmpty);
    }
  }

  void _removeEmptyOrNullHtmlTagsArrayHtmlItems() {
    for (var item in this.dataList) {
      item.htmlTags
          .removeWhere((item) => item.html == null || item.html.trim().isEmpty);
    }
  }

  void _removeEmptyOrNullPdfLinkAndHtmlTagArrays() {
    this.dataList.removeWhere((item) =>
        (item.pdfLinks == null || item.pdfLinks.isEmpty) &&
        (item.htmlTags == null || item.htmlTags.isEmpty));
  }
}
