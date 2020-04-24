import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_local_data_source.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  ItemDataListLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ItemDataListLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastItemDataList', () {
    final tItemDataList = itemDataModelFromJson(fixture('item_data_list.json'));

    test(
      'should return itemDataList from SharedPreferences when there is one in the cache',
      () async {
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('item_data_list.json'));
        final result = await dataSource.getLastItemListData();
        verify(mockSharedPreferences.getString(CACHED_ITEM_DATA_LIST));
        expect(result, equals(tItemDataList));
      },
    );
    test(
      'should throw a CacheException when there is not a cached value',
      () async {
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        expect(() => dataSource.getLastItemListData(),
            throwsA(TypeMatcher<CacheExcepiton>()));
      },
    );
  });

  group('cacheitemDataListModel', () {
    final pdfLinks = [PdfLinkModel(title: 'title', link: 'link')];
    final testHtml = [HtmlTagModel(title: 'title', html: 'htmlCode')];
    Map<String, ItemDataModel> tItemDataListModel = {
      '5veu2czb24':
      ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
    };
    test(
      'should call SharedPreferences to cache the data',
          () async {
        dataSource.cacheItemListData(tItemDataListModel);
        final expectedJsonString = itemDataMapModelToJson(tItemDataListModel);
        verify(mockSharedPreferences.setString(
            CACHED_ITEM_DATA_LIST, expectedJsonString));
      },
    );
  });
}
