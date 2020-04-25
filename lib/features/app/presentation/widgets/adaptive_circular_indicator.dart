import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AdaptiveCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      body: Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                radius: 15,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
