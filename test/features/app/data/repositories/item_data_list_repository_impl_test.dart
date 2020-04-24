import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/network/network_info.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_local_data_source.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_remote_data_source.dart';
import 'package:jpt_app/features/app/data/models/item_data_list_model.dart';
import 'package:jpt_app/features/app/data/repositories/item_data_list_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements ItemDataListRemoteDataSource {}

class MockLocalDataSource extends Mock implements ItemDataListLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ItemListDataRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ItemListDataRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getItemDataList', () {
    final pdfLinks = [PdfLinkModel(title: 'title', link: 'link')];
    final testHtml = [HtmlTagModel(title: 'title', html: 'htmlCode')];
    Map<String, ItemDataModel> tItemDataListModel = {
      '5veu2czb24':
          ItemDataModel(pdfLinks: pdfLinks, htmlTags: testHtml, title: 'title')
    };

    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.getItemListData();
      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getItemListData())
              .thenAnswer((_) async => tItemDataListModel);
          final result = await repository.getItemListData();
          verify(mockRemoteDataSource.getItemListData());
          expect(result, equals(Right(tItemDataListModel)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getItemListData())
              .thenAnswer((_) async => tItemDataListModel);
          await repository.getItemListData();
          verify(mockRemoteDataSource.getItemListData());
          verify(mockLocalDataSource.cacheItemListData(tItemDataListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(mockRemoteDataSource.getItemListData())
              .thenThrow(ServerException());
          final result = await repository.getItemListData();
          verify(mockRemoteDataSource.getItemListData());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
    runTestOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          when(mockLocalDataSource.getLastItemListData())
              .thenAnswer((_) async => tItemDataListModel);
          final result = await repository.getItemListData();
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastItemListData());
          expect(result, equals(Right(tItemDataListModel)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(mockLocalDataSource.getLastItemListData())
              .thenThrow(CacheExcepiton());
          final result = await repository.getItemListData();
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastItemListData());
          expect(result, equals(Left(CacheFaliure())));
        },
      );
    });
  });
}
