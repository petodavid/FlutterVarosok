import 'dart:convert';

import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

Map<String, ItemDataModel> itemDataModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, ItemDataModel>(k, ItemDataModel.fromJson(v)));

String itemDataMapModelToJson(Map<String, ItemDataModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

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
  final String html;
  final String title;

  HtmlTagModel({
    this.html,
    this.title,
  }) : super(html: html, title: title);

  factory HtmlTagModel.fromJson(Map<String, dynamic> json) => HtmlTagModel(
        html: json["html"] == null ? null : json["html"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "html": html == null ? null : html,
        "title": title == null ? null : title,
      };
}

class PdfLinkModel extends PdfLink {
  final String link;
  final String title;

  PdfLinkModel({
    this.link,
    this.title,
  }) : super(link: link, title: title);

  factory PdfLinkModel.fromJson(Map<String, dynamic> json) => PdfLinkModel(
        link: json["link"] == null ? null : json["link"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? null : link,
        "title": title == null ? null : title,
      };
}

extension RemoveEmptyDataLists on Map<String, ItemDataModel> {
  void removeEmptyDataLists() {
    _removeEmptyOrNullTitleItems();
    _removeEmptyOrNullKeys();
    _removeEmptyOrNullPdfLinkArrayTargetLinkItems();
    _removeEmptyOrNullHtmlTagsArrayHtmlItems();
    _removeEmptyOrNullPdfLinkAndHtmlTagArrays();
  }

  void _removeEmptyOrNullTitleItems() {
    this.removeWhere(
        (key, value) => value.title == null || value.title.trim().isEmpty);
  }

  _removeEmptyOrNullKeys() {
    this.removeWhere((key, value) => key == null || key.trim().isEmpty);
  }

  void _removeEmptyOrNullPdfLinkArrayTargetLinkItems() {
    for (var item in this.values) {
      item.pdfLinks
          .removeWhere((item) => item.link == null || item.link.trim().isEmpty);
    }
  }

  void _removeEmptyOrNullHtmlTagsArrayHtmlItems() {
    for (var item in this.values) {
      item.htmlTags
          .removeWhere((item) => item.html == null || item.html.trim().isEmpty);
    }
  }

  void _removeEmptyOrNullPdfLinkAndHtmlTagArrays() {
    this.removeWhere((key, value) =>
        (value.pdfLinks == null || value.pdfLinks.isEmpty) &&
        (value.htmlTags == null || value.htmlTags.isEmpty));
  }
}
