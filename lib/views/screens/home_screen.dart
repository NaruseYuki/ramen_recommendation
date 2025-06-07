// lib/views/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/viewmodels/home_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final homeViewModel = ref.read(homeViewModelProvider.notifier);

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
                  builder: (context) => const FavoritePlacesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: homeState.isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildContent(context, homeState, homeViewModel),
                ),
              ),
      ),
      bottomNavigationBar: homeState.isLoading
          ? const SizedBox.shrink()
          : _buildBottomBar(context, homeState, homeViewModel),
    );
  }

  Widget _buildContent(
      BuildContext context, RamenState state, HomeViewModel viewModel) {
    final scaffoldManager = ScaffoldMessenger.of(context);
    List<Widget> children = [];

    if (state.imageFile == null) {
      children.add(const Text('画像を選択してください'));
    } else {
      children.add(
        Image.file(
          state.imageFile!,
          width: 300,
          height: 300,
        ),
      );
    }
    children.addAll([
      ElevatedButton(
        onPressed: () async {
          await viewModel.pickImageFromGalleryWithPermission();
          if (state.error != null) {
            scaffoldManager.showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        child: const Text('ギャラリーから選択'),
      ),
      ElevatedButton(
        onPressed: () async {
          await viewModel.pickImageFromCameraWithPermission();
          if (state.error != null) {
            scaffoldManager.showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        child: const Text('カメラで撮影'),
      ),
    ]);

    if (state.result != null) {
      children.add(Text('分析結果: ${state.result}'));
    }
    if (state.error != null) {
      children.add(
        Text(
          'エラー: ${state.error}',
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
      BuildContext context, RamenState state, HomeViewModel viewModel) {
    final isSearchDisabled =
        state.result == null || state.result?.split(' ')[0] == '4';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isSearchDisabled
            ? null
            : () async {
                // ここで検索処理を呼び出す
                // 必要に応じてviewModel経由でメソッドを追加してください
              },
        child: Text(
          isSearchDisabled ? '検索できません' : '付近のラーメンを検索',
        ),
      ),
    );
  }
}
