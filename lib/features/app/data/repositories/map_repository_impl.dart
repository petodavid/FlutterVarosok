import 'package:jpt_app/features/app/domain/entities/map.dart';
import 'package:jpt_app/features/app/domain/repositories/map_repository.dart';
import 'package:mapbox_search/mapbox_search.dart';

class LatLongForMapImpl implements LatLongForMapRepository {
  @override
  Future<MapLatLong> selectedCityCoordinates(String cityName) async {
    var placesSearch = PlacesSearch(
      apiKey:
          'pk.eyJ1IjoicGV0b2RhdmlkIiwiYSI6ImNrM3E2MW03czA5cWIzY29heWdhNXVqdTIifQ.5NWTcSFCokiZ-ykifqRX0Q',
      limit: 1,
    );

    final cityMatch = await placesSearch.getPlaces(cityName);
    final long = cityMatch.first.geometry.coordinates.first;
    final lat = cityMatch.first.geometry.coordinates.last;
    final latLong = MapLatLong(latitude: lat, longitude: long);
    return latLong;
  }
}
