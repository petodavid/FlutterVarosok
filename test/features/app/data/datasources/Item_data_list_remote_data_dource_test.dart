import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_remote_data_source.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  ItemDataListRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ItemDataListRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('item_data_list.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getItemDataListModel', () {
    test(
      'should preform a GET request on a URL',
      () async {
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('item_data_list.json'), 200),
        );
        dataSource.getItemListData();
        verify(mockHttpClient.get('https://jptapp-4228f.firebaseio.com/.json',
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return IteamDataListModel when the response code is 200 (success)',
      () async {
        setUpMockHttpClientSuccess200();
        final tItemDataListModel =
            itemDataListModelFromJson(fixture('item_data_list.json'));
        final result = await dataSource.getItemListData();
        expect(result, equals(tItemDataListModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpMockHttpClientFailure404();
        expect(() => dataSource.getItemListData(),
            throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
