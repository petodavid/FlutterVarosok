import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

abstract class ItemListDataRepository {
  Future<Either<Failure, Map<String, ItemData>>> getItemDataList();

  Future<Either<Failure, ItemData>> getItemDataById(String id);
}
