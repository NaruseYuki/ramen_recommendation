import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class GooglePlacesApiClient {
  late final String _apiKey;

  GooglePlacesApiClient() {
    _loadApiKey();
  }

  /// 環境変数から API キーを読み込む
  Future<void> _loadApiKey() async {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    final envFileName = '.env.$flavor';

    final envData = await rootBundle.loadString(envFileName);
    final label = envData.split('\n');
    _apiKey = label
        .firstWhere((line) => line.startsWith('GOOGLE_MAPS_API_KEY'))
        .split(' ')[1]
        .trim();
  }

  /// Google Places API に POST リクエストを送信
  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('https://places.googleapis.com/v1/$endpoint');
    final headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': _apiKey,
      'X-Goog-FieldMask': 'places.displayName,places.formattedAddress,places.location,places.id'
    };

    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send POST request: $e');
    }
  }

  /// Google Places API に GET リクエストを送信
  Future<Map<String, dynamic>> get(
      String endpoint, Map<String, String> queryParams) async {
    final query =
        queryParams.entries.map((e) => '${e.key}=${e.value}').join('&');
    final url = Uri.parse('https://places.googleapis.com/v1/$endpoint?$query');
    final headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': _apiKey,
      'X-Goog-FieldMask': 'displayName,formattedAddress,currentOpeningHours,rating,userRatingCount,websiteUri,reviews,location' // 必要なフィールド
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send GET request: $e');
    }
  }
}
