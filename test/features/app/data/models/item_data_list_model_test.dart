import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final pdfLinks = [PdfLinkModel(title: 'title', link: 'link')];
  final testHtml = [HtmlTagModel(title: 'title', html: 'htmlCode')];
  Map<String, ItemDataModel> tItemDataListModel = {
    '5veu2czb24':
        ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
  };

  test(
    'should be a subclass of ItemDataList entity',
    () async {
      for (var item in tItemDataListModel.values) {
        expect(item, isA<ItemData>());
      }
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        final jsonString = fixture('item_data_list.json');
        final result = itemDataModelFromJson(jsonString);
        expect(result, tItemDataListModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = json.decode(itemDataMapModelToJson(tItemDataListModel));
        final expectedJsonMap = json.decode(fixture('item_data_list.json'));
        expect(result, expectedJsonMap);
      },
    );
  });
}
