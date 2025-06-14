import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/viewmodels/home_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';
import 'package:ramen_recommendation/views/screens/search_results_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeViewModel = ref.read(homeViewModelProvider.notifier);
      homeViewModel.stateInitialize();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // onResume時にRamenStateを初期化
      ref.read(homeViewModelProvider.notifier).stateClear();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr()),
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
                  child: _buildContent(context, homeState),
                ),
              ),
      ),
      bottomNavigationBar: homeState.isLoading
          ? const SizedBox.shrink()
          : _buildBottomBar(context, homeState),
    );
  }

  Widget _buildContent(BuildContext context, RamenState state) {
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
          await homeViewModel.pickImageFromGalleryWithPermission();
          if (state.error != null) {
            scaffoldManager.showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        child: Text('home.gallery_select'.tr()),
      ),
      ElevatedButton(
        onPressed: () async {
          await homeViewModel.pickImageFromCameraWithPermission();
          if (state.error != null) {
            scaffoldManager.showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        child: Text('home.camera_capture'.tr()),
      ),
    ]);

    if (state.result != null) {
      children.add(Text('home.analysis_result'.tr(args: [state.result ?? ''])));
    }

    if (state.error != null) {
      children.add(
        Text(
          'home.error'.tr(args: [state.error.toString()]),
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildBottomBar(BuildContext context, RamenState state) {
    final isSearchDisabled =
        state.result == null || state.result?.split(' ')[0] == '4';
    final keyword = state.result?.split(' ')[1] ?? '';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isSearchDisabled
            ? null
            : () {
                final route = MaterialPageRoute(
                  builder: (context) => SearchResultsScreen(ramenType: keyword),
                );
                Navigator.push(context, route);
              },
        child: Text(
          isSearchDisabled
              ? 'home.search_disabled'.tr()
              : 'home.search_nearby'.tr(),
        ),
      ),
    );
  }
}
