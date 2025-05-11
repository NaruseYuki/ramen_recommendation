import 'package:geolocator/geolocator.dart';

class SearchRamenPlacesRequest {
  final String keyword;
  final Position position;
  final int pageSize;
  final String languageCode;
  final double radius;

  SearchRamenPlacesRequest({
    required this.keyword,
    required this.position,
    this.pageSize = 10,
    this.languageCode = 'ja',
    this.radius = 500.0,
  });

  Map<String, dynamic> toRequestBody() {
    return {
      'textQuery': keyword,
      'pageSize': pageSize,
      'languageCode': languageCode,
      'locationBias': {
        'circle': {
          'center': {
            'latitude': position.latitude,
            'longitude': position.longitude,
          },
          'radius': radius,
        },
      },
    };
  }
}
