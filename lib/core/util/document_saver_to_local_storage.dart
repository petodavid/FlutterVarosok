import 'dart:io';

import 'package:directory_picker/directory_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<bool> savePFDDocumentToLocalStorage(
    String urlToSave, String fileTitle, BuildContext context) async {
  return Platform.isIOS
      ? await _saveOnIos(urlToSave, fileTitle)
      : await _saveOnAndroid(urlToSave, fileTitle, context);
}

Future<bool> _saveOnAndroid(
    String urlToSave, String fileTitle, BuildContext context) async {
  try {
    Directory selectedDirectory = await DirectoryPicker.pick(
        allowFolderCreation: true,
        context: context,
        rootDirectory: await getExternalStorageDirectory());

    if (selectedDirectory != null) {
      final pdfFile = await http.get(urlToSave);
      final file = File('${selectedDirectory.path}/$fileTitle.pdf');
      file.writeAsBytesSync(pdfFile.bodyBytes);
      return Future.value(true);
    }
  } on Exception catch (e) {
    print(e);
    return Future.value(false);
  }
  return Future.value(false);
}

Future<bool> _saveOnIos(String urlToSave, String fileTitle) async {
  try {
    Directory docDir = await getApplicationDocumentsDirectory();
    final pdfFile = await http.get(urlToSave);
    final file = File('${docDir.path}/$fileTitle.pdf');
    file.writeAsBytesSync(pdfFile.bodyBytes);
    return Future.value(true);
  } on Exception catch (e) {
    print(e);
    return Future.value(false);
  }
}
