import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/repositories/item_data_list_repository.dart';

class GetItemDataList extends UseCase<Map<String, ItemData>, NoParams> {
  final ItemListDataRepository repository;

  GetItemDataList(this.repository);

  Future<Either<Failure, Map<String, ItemData>>> call(NoParams params) async {
    return await repository.getItemDataList();
  }
}
