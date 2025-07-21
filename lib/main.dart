// lib/main.dart
import 'package:device_preview/device_preview.dart'; // DevicePreviewをインポート
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart'; // kDebugModeを使用するためにインポート
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    DevicePreview(
      // デバッグモードでのみDevicePreviewを有効にする
      enabled: !kReleaseMode, //
      builder: (context) => EasyLocalization(
        supportedLocales: [Locale('ja', 'JP')], // 日本語
        path: 'assets/translations', // 翻訳ファイルのパス
        fallbackLocale: Locale('ja', 'JP'), // フォールバックロケール
        child: ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ezContext = EasyLocalization.of(context)!;
    return MaterialApp(
      useInheritedMediaQuery: true,
      // DevicePreviewのために必要
      // localeプロパティはDevicePreviewとEasyLocalizationの両方で設定されているため、
      // DevicePreviewを使用する場合はDevicePreview.locale(context)を使用し、EasyLocalizationのlocaleも考慮します。
      // ここではDevicePreviewのlocaleを優先しますが、EasyLocalizationのlocaleと競合しないように注意が必要です。
      locale: DevicePreview.locale(context) ?? ezContext.locale,
      //
      builder: DevicePreview.appBuilder,
      // DevicePreviewのために必要
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, //
        GlobalWidgetsLocalizations.delegate, //
        GlobalCupertinoLocalizations.delegate, //
        ezContext.delegate // EasyLocalizationのデリゲート
      ],
      supportedLocales: ezContext.supportedLocales,
      //
      // locale: ezContext.locale, // DevicePreviewと重複するためコメントアウトまたは調整
      debugShowCheckedModeBanner: false,
      //
      theme: _buildThemeData(),
      //
      home: HomeScreen(), //
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      fontFamily: 'SourceHanSansJP', //
      appBarTheme: _buildAppBarTheme(), //
      elevatedButtonTheme: _buildElevatedButtonTheme(), //
      cardTheme: _buildCardTheme(), //
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColor.primary, //
      foregroundColor: Colors.white, //
      titleTextStyle: TextStyle(
        fontSize: 20, //
        fontWeight: FontWeight.bold, //
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        //
        foregroundColor: Colors.white,
        //
        textStyle: const TextStyle(
          fontSize: 16, //
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), //
        ),
      ),
    );
  }

  CardThemeData _buildCardTheme() {
    return CardThemeData(
      elevation: 4, //
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), //
      ),
    );
  }
}
