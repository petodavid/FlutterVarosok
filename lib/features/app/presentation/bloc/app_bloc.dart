import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_data_by_id.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetItemDataList getItemDataList;
  final GetItemDataById getItemDataById;

  AppBloc({
    @required GetItemDataList getItemDataList,
    @required GetItemDataById getItemDataById,
  })  : assert(getItemDataList != null),
        assert(getItemDataById != null),
        getItemDataList = getItemDataList,
        getItemDataById = getItemDataById;

  @override
  AppState get initialState => Empty();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is GetForItemDataById) {
      yield Loading();
      final failureOrItemData = await getItemDataById(Params(id: event.id));
      yield* _eitherItemDataByIdOrErrorState(failureOrItemData);
    } else if (event is GetDataListForItems) {
      yield Loading();
      final failureOrItemDataList = await getItemDataList(NoParams());
      yield* _eitherItemDataListOrErrorState(failureOrItemDataList);
    }
  }
}

Stream<AppState> _eitherItemDataListOrErrorState(
  Either<Failure, Map<String, ItemData>> either,
) async* {
  yield either.fold(
    (failure) => Error(message: _mapFailureToMessage(failure)),
    (itemDataList) => LoadedItemDataList(itemDataList: itemDataList),
  );
}

Stream<AppState> _eitherItemDataByIdOrErrorState(
  Either<Failure, ItemData> either,
) async* {
  yield either.fold(
    (failure) => Error(message: _mapFailureToMessage(failure)),
    (itemData) => LoadedItemDataById(itemData: itemData),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Error';
    case CacheFaliure:
      return 'Cache Error';
    default:
      return 'Unexpected Error';
  }
}
