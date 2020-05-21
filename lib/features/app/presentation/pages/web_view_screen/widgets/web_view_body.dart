import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatelessWidget {
  final String siteAddress;

  WebViewBody({@required this.siteAddress});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: siteAddress,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
