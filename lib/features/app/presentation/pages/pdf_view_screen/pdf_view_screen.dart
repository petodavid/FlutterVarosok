import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/core/util/document_saver_to_local_storage.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';
import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';
import 'package:theme_provider/theme_provider.dart';

class PdfViewScreen extends StatelessWidget {
  final String pdfLink;
  final String title;

  PdfViewScreen({@required this.pdfLink, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, title),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeProvider.optionsOf<GradientOptions>(context)
                  .homeListScreenStartGradient,
              ThemeProvider.optionsOf<GradientOptions>(context)
                  .homeListScreenEndGradient,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: _pdfView(),
            ),
            Expanded(
              flex: 1,
              child: _saveButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pdfView() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(60),
        bottomLeft: Radius.circular(60),
      ),
      child: SimplePdfViewerWidget(
        completeCallback: (bool result) {
          print(result);
        },
        initialUrl: pdfLink,
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.5,
      child: GestureDetector(
        onTap: () async {
          await savePFDDocumentToLocalStorage(pdfLink, title);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent,
          ),
          // margin: EdgeInsets.all(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.cloudDownloadAlt,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                AppLocalizations.of(context).translate('save'),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .title
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
