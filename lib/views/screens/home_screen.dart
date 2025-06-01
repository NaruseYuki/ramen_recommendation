// lib/views/screens/home_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/viewmodels/app_viewmodel.dart'; // AppViewModelをインポート
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';
import 'package:ramen_recommendation/views/screens/search_results_screen.dart';


class HomeScreen extends ConsumerStatefulWidget {
  final AppInitializer appInitializer;
  const HomeScreen({super.key, required this.appInitializer});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final AppViewModel appViewModel; // AppViewModelを使用

  @override
  void initState() {
    super.initState();
    appViewModel = ref.read(widget.appInitializer.appViewModelProvider.notifier); // AppViewModelを初期化
    appViewModel.loadModel(); // AppViewModel経由でモデルをロード
  }

  @override
  Widget build(BuildContext context) {
    // AppViewModelから結合された状態を監視
    final appState = ref.watch(widget.appInitializer.appViewModelProvider);
    final imageState = appState.imageClassificationState; // 個々の状態にアクセス
    final locationState = appState.locationState; // 個々の状態にアクセス

    return Scaffold(
      appBar: AppBar(
        title: const Text('推しメンアナライザ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePlacesScreen(
                      appInitializer: widget.appInitializer),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: locationState.isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildContent(context, imageState),
          ),
        ),
      ),
      bottomNavigationBar: locationState.isLoading
          ? const SizedBox.shrink()
          :_buildBottomBar(context, imageState, locationState),
    );
  }

  Widget _buildContent(BuildContext context, imageState) { // imageState は RamenState<File>
    List<Widget> children = [];

    if (imageState.imageFile == null) {
      children.add(const Text('画像を選択してください'));
    } else if (imageState.imageFile != null) {
      children.add(
        Image.file(
          imageState.imageFile!,
          width: 300,
          height: 300,
        ),
      );
    }
    children.addAll([
      ElevatedButton(
        onPressed: () => appViewModel.pickImageFromGallery(), // AppViewModel経由で呼び出し
        child: const Text('ギャラリーから選択'),
      ),
      ElevatedButton(
        onPressed: () => appViewModel.pickImageFromCamera(), // AppViewModel経由で呼び出し
        child: const Text('カメラで撮影'),
      ),
    ]);

    if (imageState.isLoading) {
      children.add(const CircularProgressIndicator());
    } else if (imageState.result != null) {
      children.add(Text('分析結果: ${imageState.result}'));
    }

    if (imageState.error != null) {
      children.add(
        Text(
          'エラー: ${imageState.error}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildBottomBar(
      BuildContext context, imageState, locationState) { // imageState と locationState は RamenState
    final isSearchDisabled =
        imageState.result == null || imageState.result?.split(' ')[0] == '4';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isSearchDisabled
            ? null
            : () async {
          final scaffold = ScaffoldMessenger.of(context);
          final navigation = Navigator.of(context);
          final keyword = imageState.result?.split(' ')[1] ?? '';
          final success = await appViewModel
              .searchRamenPlaces(keyword); // AppViewModel経由で呼び出し
          if (success) {
            final route = MaterialPageRoute(
              builder: (context) => SearchResultsScreen(
                  ramenType: keyword,
                  appInitializer: widget.appInitializer),
            );
            navigation.push(route);
          } else {
            scaffold.showSnackBar(
              const SnackBar(content: Text('検索に失敗しました')),
            );
          }
        },
        child: Text(
          isSearchDisabled ? '検索できません' : '付近のラーメンを検索',
        ),
      ),
    );
  }
}