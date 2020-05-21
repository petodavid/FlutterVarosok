import 'package:jpt_app/features/app/domain/entities/map.dart';

abstract class LatLongForMapRepository {
  Future<MapLatLong> selectedCityCoordinates(String cityName);
}
