import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_bloc.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_page/widgets/home_screen_app_bar.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_page/widgets/floating_action_qr_button.dart';
import 'package:jpt_app/injection_container.dart';

class HomeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeListAppBar(context),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: qrScannerButton(context),
      ),
      // body: buildBody(),
    );
  }
}

BlocProvider<AppBloc> buildBody() {
  return BlocProvider(
    builder: (_) => sl<AppBloc>(),
  );
}
