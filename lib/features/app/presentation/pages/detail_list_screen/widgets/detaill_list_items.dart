import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/entities/list_view_items.dart';
import 'package:jpt_app/features/app/presentation/pages/pdf_view_screen/pdf_view_screen.dart';
import 'package:jpt_app/features/app/presentation/pages/web_view_screen/web_view_screen.dart';

List<ListViewItem> getDetailScreenItemsList(
    BuildContext context, ItemData itemData) {
  List<ListViewItem> detailScreenItemsList = [];
  for (var item in itemData.pdfLinks) {
    detailScreenItemsList.add(_getPdflItem(context, item));
  }
  for (var item in itemData.htmlTags) {
    detailScreenItemsList.add(_getHtmlItem(context, item));
  }
  return detailScreenItemsList;
}

ListViewItem _getPdflItem(BuildContext context, PdfLink pdfLink) {
  return ListViewItem(
    title: Text(pdfLink.title),
    image: FaIcon(
      FontAwesomeIcons.solidFilePdf,
      color: Colors.blue,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfViewScreen(
            pdfLink: pdfLink.link,
            title: pdfLink.title,
          ),
        ),
      );
    },
  );
}

ListViewItem _getHtmlItem(BuildContext context, HtmlTag htmlTag) {
  return ListViewItem(
    title: Text(htmlTag.title),
    image: FaIcon(
      FontAwesomeIcons.html5,
      color: Colors.blue,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(
            html: htmlTag.html,
            title: htmlTag.title,
          ),
        ),
      );
    },
  );
}
