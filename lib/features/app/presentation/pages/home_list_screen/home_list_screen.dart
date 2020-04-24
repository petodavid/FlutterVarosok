import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_event.dart';
import 'package:jpt_app/features/app/presentation/bloc/app_state.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/widgets/floating_action_qr_button.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/widgets/home_listview.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/widgets/home_screen_app_bar.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_circular_indicator.dart';
import 'package:jpt_app/injection_container.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeListScreen extends StatelessWidget {
  static Map<String, ItemData> itemDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      appBar: homeListAppBar(context),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: qrScannerButton(context, itemDataList),
      ),
      body: buildBody(),
    );
  }

  BlocProvider<AppBloc> buildBody() {
    return BlocProvider(
      create: (_) => sl<AppBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<AppBloc>(context).add(GetDataListForItems());
            return Container();
          } else if (state is Loading) {
            return Center(
              child: AdaptiveCircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            itemDataList = state.itemDataList;
            return HomeListView(
              items: state.itemDataList,
            );
            return Container();
          } else if (state is Error) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
