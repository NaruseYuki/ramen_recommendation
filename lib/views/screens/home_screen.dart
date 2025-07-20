// lib/views/screens/home_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/home_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';
import 'package:ramen_recommendation/views/screens/search_results_screen.dart';

import 'menu/menu.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ErrorListeningScreen<HomeScreen>
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
      ref.read(homeViewModelProvider.notifier).stateClear();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ic_splash.png',
          fit: BoxFit.fill,
        ),
        centerTitle: true,
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
      drawer: const AppDrawer(),
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
          : _searchButton(context, homeState),
    );
  }

  Widget _buildContent(BuildContext context, RamenState state) {
    List<Widget> children = [];

    if (state.result != null) {
      children.add(Text('home.analysis_result'.tr(args: [state.result ?? '']),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    }

    children.add(
      const SizedBox(height: 20),
    );

    final imageWidget = state.imageFile != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(16), // ← ここで角丸を指定
            child: Image.file(
              state.imageFile!,
              fit: BoxFit.fitWidth,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/images/ic_no_image.png',
                width: double.infinity,
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.dstOver,
                color: Colors.white),
          );

    children.add(imageWidget);

    children.add(
      const SizedBox(height: 20),
    );

    children
        .add(Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      // カメラ画像ボタン
      InkWell(
        onTap: () async {
          await homeViewModel.pickImageFromCameraWithPermission();
        },
        child: CircleAvatar(
          radius: 75,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/ic_camera.jpeg',
              width: 75, height: 75),
        ),
      ),
      // ギャラリー画像ボタン
      InkWell(
        onTap: () async {
          await homeViewModel.pickImageFromGalleryWithPermission();
        },
        child: CircleAvatar(
          radius: 75,
          backgroundColor: Colors.white, // 余白部分の背景色
          child: Image.asset(
            'assets/images/ic_picture.jpeg',
            width: 75,
            height: 75,
          ),
        ),
      ),
    ]));

    children.add(
      const SizedBox(height: 20),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _searchButton(BuildContext context, RamenState state) {
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
                      builder: (context) =>
                          SearchResultsScreen(ramenType: keyword),
                    );
                    Navigator.push(context, route);
                  },
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  isSearchDisabled
                      ? 'home.search_disabled'.tr()
                      : 'home.search_nearby'.tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )));
  }
}
