import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetForItemDataById extends AppEvent {
  final String id;

  GetForItemDataById(this.id);

  @override
  List<Object> get props => [id];
}

class GetDataListForItems extends AppEvent {}
