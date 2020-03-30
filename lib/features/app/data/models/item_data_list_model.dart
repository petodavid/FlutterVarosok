import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

ItemDataListModel itemDataListModelFromJson(String str) => ItemDataListModel(
    itemDataList: List<ItemDataModel>.from(
        json.decode(str).map((x) => ItemDataModel.fromJson(x))));

String itemDatalistModeToJson(ItemDataListModel data) =>
    json.encode(List<dynamic>.from(data.itemDataList.map((x) => x.toJson())));

class ItemDataListModel extends ItemDataList {
  List<ItemDataModel> itemDataList;
  ItemDataListModel({@required this.itemDataList})
      : super(listData: itemDataList);
}

class ItemDataModel extends ItemData {
  List<HtmlTagModel> htmlTags;
  List<PdfLinkModel> pdfLinks;
  String title;
  ItemDataModel({
    @required this.htmlTags,
    @required this.pdfLinks,
    @required this.title,
  }) : super(htmlTags: htmlTags, pdfLinks: pdfLinks, title: title);

  factory ItemDataModel.fromJson(Map<String, dynamic> json) => ItemDataModel(
        htmlTags: List<HtmlTagModel>.from(
            json["htmlTags"].map((x) => HtmlTagModel.fromJson(x))),
        pdfLinks: List<PdfLinkModel>.from(
            json["pdfLinks"].map((x) => PdfLinkModel.fromJson(x))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "htmlTags": List<dynamic>.from(htmlTags.map((x) => x.toJson())),
        "pdfLinks": List<dynamic>.from(pdfLinks.map((x) => x.toJson())),
        "title": title,
      };
}

class HtmlTagModel extends HtmlTag {
  HtmlTagModel({
    @required String html,
    @required String title,
  }) : super(html: html, title: title);

  factory HtmlTagModel.fromJson(Map<String, dynamic> json) => HtmlTagModel(
        html: json["html"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "html": html,
        "title": title,
      };
}

class PdfLinkModel extends PdfLink {
  PdfLinkModel({
    @required String link,
    @required String title,
  }) : super(link: link, title: title);

  factory PdfLinkModel.fromJson(Map<String, dynamic> json) => PdfLinkModel(
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
      };
}
