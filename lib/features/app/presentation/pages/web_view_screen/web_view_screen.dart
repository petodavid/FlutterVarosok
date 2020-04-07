import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/web_view_screen/widgets/web_view_body.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';

class WebViewScreen extends StatelessWidget {
  String html;
  WebViewScreen({@required this.html});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'webPage', true),
      body: WebViewBody(html: html),
    );
  }
}
