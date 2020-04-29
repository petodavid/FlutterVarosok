import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:jpt_app/features/app/presentation/bloc/data_list_bloc/app_bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/data_list_bloc/app_event.dart';
import 'package:jpt_app/features/app/presentation/bloc/data_list_bloc/app_state.dart';
import 'package:jpt_app/features/app/presentation/pages/detail_list_screen/detail_list_screen.dart';
import 'package:jpt_app/features/app/presentation/pages/home_list_screen/home_list_screen.dart';
import 'package:jpt_app/features/app/presentation/widgets/adaptive_circular_indicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:theme_provider/theme_provider.dart';

import '../../../../../injection_container.dart';

class QrScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (_) => sl<AppBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is Empty) {
            return QrScanningUi();
          } else if (state is Loading) {
            return AdaptiveCircularProgressIndicator();
          } else if (state is LoadedItemDataById) {
            return DetailListScreen(itemData: state.itemData);
          } else if (state is Error) {
            Navigator.pop(context);
          }
          return HomeListScreen();
        },
      ),
    );
  }
}

class QrScanningUi extends StatefulWidget {
  @override
  _QrScanningUiState createState() => _QrScanningUiState();

  const QrScanningUi({
    Key key,
  }) : super(key: key);
}

class _QrScanningUiState extends State<QrScanningUi> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('qr'),
          style: ThemeProvider.themeOf(context).data.textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeProvider.optionsOf<GradientOptions>(context)
                  .homeListScreenStartGradient,
              ThemeProvider.optionsOf<GradientOptions>(context)
                  .homeListScreenEndGradient,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
          ),
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 30,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width - 100,
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      BlocProvider.of<AppBloc>(context).add(GetForItemDataById(scanData));
      dispose();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
