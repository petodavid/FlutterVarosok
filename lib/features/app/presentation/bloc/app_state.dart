import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

@immutable
abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AppState {}

class Loading extends AppState {}

class Loaded extends AppState {
  final ItemDataList itemDataList;
  Loaded({@required this.itemDataList});
  @override
  List<Object> get props => [itemDataList];
}

class Error extends AppState {
  final String message;
  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
