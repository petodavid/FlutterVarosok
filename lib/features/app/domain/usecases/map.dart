import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/features/app/domain/entities/map.dart';
import 'package:jpt_app/features/app/domain/repositories/map_repository.dart';

class LatLongForMap {
  final LatLongForMapRepository mapRepository;

  LatLongForMap(this.mapRepository);

  Future<MapLatLong> call(MapParams params) async {
    return await mapRepository.selectedCityCoordinates(params.cityName);
  }
}

class MapParams extends Equatable {
  final String cityName;

  MapParams({@required this.cityName});

  @override
  List<Object> get props => [cityName];
}
