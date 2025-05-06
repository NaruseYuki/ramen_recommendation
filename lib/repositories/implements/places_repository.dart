import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';

class PlacesRepository implements PlacesRepositoryInterface {
  /// ラーメン店を検索する
  /// [type] ラーメンの種類
  /// [position] 現在地の位置情報
  /// [return] 検索結果のリスト
  @override
  Future<List<Map<String, dynamic>>> searchRamenPlaces({
    required String type,
    required Position position,
  }) async {
    // 環境に応じて適切な .env ファイルを読み込む
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    final envFileName = '.env.$flavor';

    final envData = await rootBundle.loadString(envFileName);
    final label = envData.split('\n');
    final apiKey = label
        .firstWhere((line) => line.startsWith('GOOGLE_MAPS_API_KEY'))
        .split(' ')[1]
        .trim();

    final keyword = type.split(' ').last; // 分類結果からキーワードを取得
    const pageSize = 10;
    const languageCode = 'ja';
    const radius = 500.0;

    final url = Uri.parse(
      'https://places.googleapis.com/v1/places:searchText',
    );

    final headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'places.displayName,places.formattedAddress,places.location,places.id',
    };

    final body = jsonEncode({
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
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final results = (json['places'] as List<dynamic>?) ?? [];
        return results.cast<Map<String, dynamic>>();
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  /// ラーメン店の詳細情報を取得する
  /// [placeId] ラーメン店のID
  /// [return] ラーメン店の詳細情報
  @override
  Future<Map<String, dynamic>> getPlaceDetails({
    required String placeId,
  }) async {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    final envFileName = '.env.$flavor';

    final envData = await rootBundle.loadString(envFileName);
    final label = envData.split('\n');
    final apiKey = label
        .firstWhere((line) => line.startsWith('GOOGLE_MAPS_API_KEY'))
        .split(' ')[1]
        .trim();

    final url = Uri.parse(
      'https://places.googleapis.com/v1/places/$placeId?languageCode=ja',
    );

    final headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'displayName,formattedAddress,currentOpeningHours,rating,userRatingCount,websiteUri,reviews,location' // 必要なフィールド
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json;
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
