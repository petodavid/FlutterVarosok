import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/localization/supported_locales.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/bloc.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/home_list_screen.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_circular_indicator.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'core/localization/app_language.dart';
import 'core/themes/theme_options.dart';
import 'features/app/presentation/pages/log_in_page/log_in_page_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

BuildContext blocContext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(
    JptApp(
      appLanguage: appLanguage,
    ),
  );
}

class JptApp extends StatelessWidget {
  final AppLanguage appLanguage;

  JptApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: myThemes,
      child: ChangeNotifierProvider<AppLanguage>(
        create: (_) => appLanguage,
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return ThemeConsumer(
            child: MaterialApp(
              locale: model.appLocal,
              supportedLocales: supportedLocales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: buildHome(),
            ),
          );
        }),
      ),
    );
  }

  BlocProvider<LogInBloc> buildHome() {
    return BlocProvider(
      create: (_) => sl<LogInBloc>(),
      child: BlocBuilder<LogInBloc, LogInState>(builder: (context, state) {
        blocContext = context;
        if (state is Empty) {
          BlocProvider.of<LogInBloc>(context).add(CheckForCurrentUser());
        } else if (state is Unauthorized) {
          return LogInScreen();
        } else if (state is Authorized) {
          return HomeListScreen();
        } else if (state is LogInError) {
          return LogInScreen();
        }
        return AdaptiveCircularProgressIndicator();
      }),
    );
  }
}
