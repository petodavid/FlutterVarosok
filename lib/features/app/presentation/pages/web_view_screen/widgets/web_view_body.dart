import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatelessWidget {
  final String html;

  WebViewBody({@required this.html});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: Uri.dataFromString(html, mimeType: 'text/html').toString(),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
