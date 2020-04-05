import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/web_view_screen/widgets/web_view_app_bar.dart';
import 'package:jpt_app/features/app/presentation/pages/web_view_screen/widgets/web_view_body.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  String html;
  WebViewScreen({@required this.html});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: webViewAppBar(context),
      body: WebViewBody(html: html),
    );
  }
}
