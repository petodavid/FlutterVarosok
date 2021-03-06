import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/presentation/pages/log_in_page/widgets/arc.dart';
import 'package:jpt_app/features/app/presentation/pages/log_in_page/widgets/log_in_card.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_provider/theme_provider.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height >= 775.0
              ? MediaQuery.of(context).size.height
              : 750.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: ArcBanner(
                  lottie: Lottie.asset('lib/core/lottie/log_in_animation.json',
                      repeat: true, reverse: true),
                  height: 350,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: LogInCard(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
