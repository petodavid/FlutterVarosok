import 'package:equatable/equatable.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';

abstract class AppEvent extends Equatable {}

class GetDataListForItems extends AppEvent {}
