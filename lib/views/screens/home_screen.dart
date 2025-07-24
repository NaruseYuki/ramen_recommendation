// lib/views/screens/home_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/home_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:ramen_recommendation/views/screens/search_results_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with ErrorListeningMixin<HomeScreen>, WidgetsBindingObserver {
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
    setupErrorListener(ref);
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.white,
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
      children.addAll([
        Text('home.analysis_result'.tr(args: [state.result ?? '']),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20)
      ]);
    }

    final imageWidget = state.imageFile != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(16), // ← ここで角丸を指定
            child: Image.file(
              state.imageFile!,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/images/ic_no_image.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.dstOver,
                color: AppColor.background),
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
          backgroundColor: AppColor.secondary,
          child: Image.asset('assets/images/ic_camera.png',
              width: 100, height: 100),
        ),
      ),
      // ギャラリー画像ボタン
      InkWell(
        onTap: () async {
          await homeViewModel.pickImageFromGalleryWithPermission();
        },
        child: CircleAvatar(
          radius: 75,
          backgroundColor: AppColor.secondary, // 余白部分の背景色
          child: Image.asset(
            'assets/images/ic_picture.png',
            width: 100,
            height: 100,
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
