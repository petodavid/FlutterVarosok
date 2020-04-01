import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/exceptions.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/network/network_info.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_local_data_source.dart';
import 'package:jpt_app/features/app/data/datasources/item_data_list_remote_data_source.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/repositories/item_data_list_repository.dart';

class ItemListDataRepositoryImpl implements ItemListDataRepository {
  final ItemDataListRemoteDataSource remoteDataSource;
  final ItemDataListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ItemListDataRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, ItemDataList>> getItemListData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItemListData = await remoteDataSource.getItemListData();
        localDataSource.cacheItemListData(remoteItemListData);
        return Right(remoteItemListData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItemListData = await localDataSource.getLastItemListData();
        return Right(localItemListData);
      } on CacheExcepiton {
        return Left(CacheFaliure());
      }
    }
  }
}
