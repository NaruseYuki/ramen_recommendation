// lib/views/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/viewmodels/image_classification_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/ramen_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';
import 'package:ramen_recommendation/views/screens/search_results_screen.dart';

import '../../models/ramen_state.dart';

final ramenViewModelProvider = RamenViewModel(ImageClassificationViewModel());
final provider = ramenViewModelProvider(
    PlacesRepository(GooglePlacesApiClient()), DatabaseService());

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provider.notifier).loadModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildContent(context, state, viewModel),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context, state, viewModel),
    );
  }

  Widget _buildContent(
      BuildContext context, RamenState state, RamenViewModel viewModel) {
    List<Widget> children = [];

    if (state.imageFile != null) {
      children.add(Image.file(state.imageFile!));
    }

    children.addAll([
      ElevatedButton(
        onPressed: () => viewModel.pickImageFromGallery(),
        child: const Text('ギャラリーから選択'),
      ),
      ElevatedButton(
        onPressed: () => viewModel.pickImageFromCamera(),
        child: const Text('カメラで撮影'),
      ),
    ]);

    if (state.isLoading) {
      children.add(const CircularProgressIndicator());
    } else if (state.result != null) {
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
      BuildContext context, RamenState state, RamenViewModel viewModel) {
    final isSearchDisabled =
        state.result == null || state.result?.split(' ')[0] == '4';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isSearchDisabled
            ? null
            : () async {
                final scaffold = ScaffoldMessenger.of(context);
                final navigation = Navigator.of(context);
                final success = await viewModel.searchRamenPlaces();
                if (success) {
                  final route = MaterialPageRoute(
                    builder: (context) =>
                        SearchResultsScreen(ramenType: state.result ?? ''),
                  );
                  navigation.push(route);
                } else if (!success) {
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
