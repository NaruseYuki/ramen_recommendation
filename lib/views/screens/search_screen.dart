// lib/views/screens/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart'; // searchResultsViewModelProviderをインポート
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';

import 'map_screen.dart';
import 'ramen_list_screen.dart'; // 店舗詳細画面へ遷移
// Google Maps FlutterはここではUIのプレースホルダーのみ
// import 'package:Maps_flutter/Maps_flutter.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() =>
      _SearchScreenState(); // createStateの型を修正
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with
        ErrorListeningMixin<SearchScreen>,
        WidgetsBindingObserver,
        SingleTickerProviderStateMixin {
  // TabControllerのためにMixinを追加
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  double _currentRadius = 500.0; // 検索距離のスライダー値 (初期値: 500m)

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2つのタブ（リスト、マップ）
    _tabController.addListener(() {
      // タブが切り替わったときにUIを再構築
      if (!mounted) return;
      setState(() {});
    });

    // 初期化時にラーメン店を検索（例: デフォルトキーワードと距離で）
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _performSearch(keyword: 'ラーメン', radius: _currentRadius);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// ラーメン店の検索を実行するヘルパーメソッド
  Future<void> _performSearch(
      {required String keyword, required double radius}) async {
    final searchResultsViewModel =
        ref.read(searchResultsViewModelProvider.notifier);
    await searchResultsViewModel.searchRamenPlaces("$keyword ラーメン");
    // radiusはSearchRamenPlacesRequestのデフォルト値が500.0なので、
    // ここでスライダーの値を使いたい場合はViewModelのsearchRamenPlacesメソッドを修正する必要があります。
    // 例: await searchResultsViewModel.searchRamenPlaces(keyword, radius: radius);
    // 現在のコードではradiusはViewModel内部で固定されているため、ここではキーワードのみ渡します。
  }

  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0), // 左右のパディングを調整
          child: Container(
            height: 40, // 検索バーの高さ
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'ラーメン店を検索',
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              ),
              onSubmitted: (value) {
                // 検索バーでEnterが押されたら検索実行
                if (value.trim().isNotEmpty) {
                  _performSearch(keyword: value.trim(), radius: _currentRadius);
                }
              },
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColor.secondary,
          // タブのインジケーターの色
          labelColor: Colors.white,
          // 選択されたタブのラベル色
          unselectedLabelColor: Colors.white70,
          // 未選択のタブのラベル色
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'カード'),
            Tab(icon: Icon(Icons.map), text: 'マップ'),
          ],
        ),
      ),
      body: Column(
        children: [
          // 距離設定用のスライダー
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                _customSlider(),
                Text('${_currentRadius.round()}m'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 1. 店舗リストビュー
                RamenListScreen(),
                // 2. マップビュー
                MapScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customSlider() {
    return Expanded(
      child: Slider(
        activeColor: AppColor.secondary,
        value: _currentRadius,
        min: 100,
        // 最小距離 (例: 100m)
        max: 5000,
        // 最大距離 (例: 5km)
        divisions: 49,
        // (max - min) / stepSize (例: 100m刻みなら49)
        label: '${_currentRadius.round()}m',
        onChanged: (double value) {
          setState(() {
            _currentRadius = value;
          });
        },
        onChangeEnd: (double value) {
          // スライダーを離したときに検索を実行
          _performSearch(
              keyword: _searchController.text.isEmpty
                  ? 'ラーメン'
                  : _searchController.text,
              radius: value);
        },
      ),
    );
  }
}
