import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

@immutable
abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDataListForItems extends AppEvent {}
