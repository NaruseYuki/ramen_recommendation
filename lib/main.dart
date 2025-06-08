// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // GooglePlacesApiClientの初期化
  await GooglePlacesApiClient().initialize();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: HomeScreen(),
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
