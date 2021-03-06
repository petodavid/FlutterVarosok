import 'package:equatable/equatable.dart';

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
