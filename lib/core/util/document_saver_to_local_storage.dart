import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> savePFDDocumentToLocalStorage(
    String urlToSave, String fileTitle) async {
  return Platform.isIOS
      ? await _saveOnIos(urlToSave, fileTitle)
      : await _saveOnAndroid(urlToSave, fileTitle);
}

Future<bool> _saveOnAndroid(String urlToSave, String fileTitle) async {
  try {
    if (await Permission.storage
        .request()
        .isGranted) {
      Directory downloadsDirectoryPath =
      await DownloadsPathProvider.downloadsDirectory;
      print(downloadsDirectoryPath);
      File('$downloadsDirectoryPath/valami/counter.txt')
          .create(recursive: false)
          .then((File file) {
        return;
      });
    }
  } on Exception catch (e) {
    print(e);
  }
}

Future<bool> _saveOnIos(String urlToSave, String fileTitle) async {
  try {
    Directory docDir = await getApplicationDocumentsDirectory();
    final pdfFile = await http.get(urlToSave);
    final file = File('${docDir.path}/${fileTitle}.pdf');
    file.writeAsBytesSync(pdfFile.bodyBytes);
    return Future.value(true);
  } on Exception catch (e) {
    print(e);
    return Future.value(false);
  }
}
