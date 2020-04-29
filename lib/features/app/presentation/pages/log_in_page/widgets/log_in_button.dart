import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/log_in_bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/log_in_event.dart';
import 'package:theme_provider/theme_provider.dart';

Widget logInButton(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController) {
  return Container(
    margin: EdgeInsets.only(top: 180.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      gradient: LinearGradient(
          colors: [
            ThemeProvider.optionsOf<GradientOptions>(context)
                .homeListScreenStartGradient,
            ThemeProvider.optionsOf<GradientOptions>(context)
                .homeListScreenEndGradient,
          ],
          begin: const FractionalOffset(0.2, 0.2),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    ),
    child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: ThemeProvider.optionsOf<GradientOptions>(context)
            .homeListScreenEndGradient,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            AppLocalizations.of(context).translate('logIn'),
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "WorkSansBold"),
          ),
        ),
        onPressed: () async {
          BlocProvider.of<LogInBloc>(context)
              .add(UserLogin(emailController.text, passwordController.text));
        }),
  );
}
