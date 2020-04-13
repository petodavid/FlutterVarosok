import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jpt_app/core/auth/currest_user.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/home_list_screen.dart';
import 'package:jpt_app/features/app/presentation/pages/log_in_page/log_in_page_screen.dart';
import 'package:theme_provider/theme_provider.dart';

import 'core/themes/theme_options.dart';
import 'features/app/presentation/widgets/adaptive_circular_indicator.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(JptApp());
}

class JptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: myThemes,
      child: ThemeConsumer(
        child: MaterialApp(
          supportedLocales: [
            const Locale('en', ''),
            const Locale('hu', ''),
          ],
          // These delegates make sure that the localization data for the proper language is loaded
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (locale != null &&
                  locale.languageCode != null &&
                  supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            return supportedLocales.first;
          },
          home: FutureBuilder<bool>(
            future: CurrentUser().isSignedIn(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data ? HomeListScreen() : LogInScreen();
              }
              return Center(
                child: AdaptiveCircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
