// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 必要なサービスを初期化
  final tfliteService = TFLiteService();
  final imagePickerService = ImagePickerService();
  final googlePlacesApiClient = GooglePlacesApiClient();
  final placesRepository = PlacesRepository(googlePlacesApiClient);
  final databaseService = DatabaseService();

  // AppInitializer をインスタンス化して初期化
  final appInitializer = AppInitializer(
    tfliteService: tfliteService,
    imagePickerService: imagePickerService,
    googlePlacesApiClient: googlePlacesApiClient,
    placesRepository: placesRepository,
    databaseService: databaseService,
  );
  await appInitializer.initialize();
  runApp(
    ProviderScope(
      child: MyApp(appInitializer: appInitializer),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppInitializer appInitializer;

  const MyApp({super.key, required this.appInitializer});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'), // 日本語
      ],
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      home: HomeScreen(appInitializer: appInitializer),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.green,
      fontFamily: 'Noto Sans JP', // フォントを指定
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      cardTheme: _buildCardTheme(),
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  CardTheme _buildCardTheme() {
    return CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
