// lib/views/screens/search_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart'; // RamenPlaceモデルをインポート
import 'package:ramen_recommendation/models/ramen_state.dart'; // RamenStateモデルをインポート
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart'; // searchResultsViewModelProviderをインポート
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart'; // 店舗詳細画面へ遷移
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
    await searchResultsViewModel.searchRamenPlaces(keyword);
    // radiusはSearchRamenPlacesRequestのデフォルト値が500.0なので、
    // ここでスライダーの値を使いたい場合はViewModelのsearchRamenPlacesメソッドを修正する必要があります。
    // 例: await searchResultsViewModel.searchRamenPlaces(keyword, radius: radius);
    // 現在のコードではradiusはViewModel内部で固定されているため、ここではキーワードのみ渡します。
  }

  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    final searchResultsState = ref.watch(searchResultsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        // AppBarの背景色とテキストスタイルはmain.dartのテーマから取得
        // titleの代わりに柔軟な検索バーを配置
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
          indicatorColor: Colors.white,
          // タブのインジケーターの色
          labelColor: Colors.white,
          // 選択されたタブのラベル色
          unselectedLabelColor: Colors.white70,
          // 未選択のタブのラベル色
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'リスト'),
            Tab(icon: Icon(Icons.map), text: 'マップ'),
          ],
        ),
      ),
      body: Column(
        children: [
          // 距離設定用のスライダー
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
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
                ),
                Text('${_currentRadius.round()}m'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 1. 店舗リストビュー
                _buildRamenList(searchResultsState),
                // 2. マップビュー
                _buildMapView(searchResultsState),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 店舗リストビューを構築するメソッド
  Widget _buildRamenList(RamenState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.places.isEmpty) {
      return Center(child: Text('search_results.not_found'.tr()));
    }
    return ListView.builder(
      itemCount: state.places.length,
      itemBuilder: (context, index) {
        final place = state.places[index] as RamenPlace; // RamenPlaceにキャスト
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(place.displayName.text,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(place.address),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.grey),
            onTap: () {
              // 店舗詳細画面へ遷移
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColor.primary,
                isScrollControlled: true,
                useSafeArea: true,
                showDragHandle: true,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: PlaceDetailScreen(placeId: place.id),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  // マップビューを構築するメソッド (Google Mapsのプレースホルダー)
  Widget _buildMapView(RamenState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.places.isEmpty) {
      return Center(child: Text('search_results.not_found'.tr()));
    }
    // ここにGoogleMapウィジェットを配置します。
    // 例:
    // return GoogleMap(
    //   initialCameraPosition: CameraPosition(
    //     target: LatLng(state.places.first.location.latitude, state.places.first.location.longitude),
    //     zoom: 14,
    //   ),
    //   markers: state.places.map((place) => Marker(
    //     markerId: MarkerId(place.id),
    //     position: LatLng(place.location.latitude, place.location.longitude),
    //     infoWindow: InfoWindow(title: place.displayName.text),
    //   )).toSet(),
    //   myLocationEnabled: true,
    //   myLocationButtonEnabled: true,
    // );
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'マップビューは現在表示できません。\n地図表示にはGoogle Maps SDKの設定が必要です。',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
