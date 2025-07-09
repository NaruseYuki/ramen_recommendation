import 'package:flutter/services.dart';

/// 環境変数から API キーを読み込む
Future<String> getAPIKey() async {
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final envFileName = '.env.$flavor';

  final envData = await rootBundle.loadString(envFileName);
  final label = envData.split('\n');
  return label
      .firstWhere((line) => line.startsWith('GOOGLE_MAPS_API_KEY'))
      .split(' ')[1]
      .trim();
}