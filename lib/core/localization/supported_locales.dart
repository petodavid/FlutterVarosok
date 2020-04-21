import 'package:flutter/cupertino.dart';

Iterable<Locale> get supportedLocales => [
      const Locale('en', 'US'),
      const Locale('hu', 'HU'),
    ];

extension LocaleName on Locale {
  String get fullName {
    switch (this.languageCode) {
      case 'en':
        {
          return 'English';
        }
        break;

      case 'hu':
        {
          return 'Magyar';
        }
        break;
    }
    return '';
  }
}
