import 'package:flutter/material.dart';
import 'package:jpt_app/features/app/data/repositories/map_repository_impl.dart';
import 'package:jpt_app/features/app/domain/repositories/map_repository.dart';
import 'package:jpt_app/features/app/domain/usecases/map.dart';
import 'package:jpt_app/features/app/presentation/widgets/gradient_app_bar_with_title.dart';
import 'package:jpt_app/injection_container.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_search/mapbox_search.dart';

class MapScreen extends StatelessWidget {
  final String cityName;
  LatLng latlng = LatLng(3.0, 50.0);
  MapboxMapController mapController;

  MapScreen({@required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, cityName),
      body: MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(50.25, 13.50),
          zoom: 3,
        ),
      ),
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _showSelectedCity();
  }

  void _showSelectedCity() async {
    var mapUseCase = sl<LatLongForMap>();
    var latLong = await mapUseCase(MapParams(cityName: cityName));
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latLong.latitude, latLong.longitude),
          zoom: 12.0,
        ),
      ),
    );
  }
}
