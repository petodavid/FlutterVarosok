import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final pdfLinks = [PdfLinkModel(id: 'id', title: 'title', link: 'link')];
  final testHtml = [HtmlTagModel(id: 'id', title: 'title', html: 'htmlCode')];
  final itemData = [
    ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title'),
    ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
  ];
  final tItemDataListModel = ItemDataListModel(itemDataList: itemData);

  test(
    'should be a subclass of ItemDataList entity',
    () async {
      expect(tItemDataListModel, isA<ItemDataList>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        final jsonString = fixture('item_data_list.json');
        final result = itemDataListModelFromJson(jsonString);
        expect(result, tItemDataListModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = json.decode(itemDatalistModeToJson(tItemDataListModel));
        final expectedJsonMap = json.decode(fixture('item_data_list.json'));
        expect(result, expectedJsonMap);
      },
    );
  });
}
