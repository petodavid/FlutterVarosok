import 'package:flutter/material.dart';
import 'package:jpt_app/core/localization/app_localization.dart';
import 'package:jpt_app/core/themes/theme_options.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:theme_provider/theme_provider.dart';

class QrScannerScreen extends StatefulWidget {
  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String qrText;
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('qr')),
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
      setState(() {
        qrText = scanData;
        print(qrText);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
