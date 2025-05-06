import 'package:geolocator/geolocator.dart';

abstract class PlacesRepositoryInterface {
  Future<List<Map<String, dynamic>>> searchRamenPlaces({
    required String type,
    required Position position,
  });

  Future<Map<String, dynamic>> getPlaceDetails({
    required String placeId,
  });
}
