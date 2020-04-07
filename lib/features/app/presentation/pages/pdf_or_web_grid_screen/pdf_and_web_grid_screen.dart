import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/screen_content.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/presentation/pages/pdf_or_web_grid_screen/widgets/pdf_and_web_grid_container.dart';
import 'package:jpt_app/features/app/presentation/pages/pdf_view_screen/pdf_view_screen.dart';
import 'package:jpt_app/features/app/presentation/pages/web_view_screen/web_view_screen.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';

class PdfOrGridScreen extends StatefulWidget {
  final ScreenContent screenContent;
  final ItemData itemData;

  PdfOrGridScreen({@required this.screenContent, this.itemData});

  @override
  _PdfOrGridScreenState createState() => _PdfOrGridScreenState();
}

class _PdfOrGridScreenState extends State<PdfOrGridScreen> {
  IconData girdIcon;
  int itemCount;
  List<String> titles = [];
  List<String> content = [];
  @override
  void initState() {
    _initActualScreenBasedOnScreenContentType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, widget.itemData.title),
      body: GridView.builder(
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          padding: const EdgeInsets.all(20),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _navigateToContetScreen(content[index], titles[index]);
              },
              child:
                  PdfAndWebGridContainer(icon: girdIcon, title: titles[index]),
            );
          }),
    );
  }

  void _initActualScreenBasedOnScreenContentType() {
    switch (widget.screenContent) {
      case ScreenContent.pdfGridScreen:
        {
          girdIcon = FontAwesomeIcons.solidFilePdf;
          itemCount = widget.itemData.pdfLinks.length;
          for (var item in widget.itemData.pdfLinks) {
            titles.add(item.title);
            content.add(item.link);
          }
        }
        break;
      case ScreenContent.webGridScreen:
        {
          girdIcon = FontAwesomeIcons.html5;
          itemCount = widget.itemData.htmlTags.length;
          for (var item in widget.itemData.htmlTags) {
            titles.add(item.title.toString());
            content.add(item.html);
          }
        }
        break;
    }
  }

  void _navigateToContetScreen(String content, String title) {
    switch (widget.screenContent) {
      case ScreenContent.pdfGridScreen:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PdfViewScreen(pdfLink: content, title: title),
            ),
          );
        }
        break;
      case ScreenContent.webGridScreen:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(html: content),
            ),
          );
        }
        break;
    }
  }
}
