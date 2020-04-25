import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/repositories/item_data_list_repository.dart';

class GetItemDataById implements UseCase<ItemData, Params> {
  final ItemListDataRepository repository;

  GetItemDataById(this.repository);

  @override
  Future<Either<Failure, ItemData>> call(Params params) async {
    return await repository.getItemDataById(params.id);
  }
}

class Params extends Equatable {
  final String id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}
