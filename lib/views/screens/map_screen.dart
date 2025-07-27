import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart';

import 'base/common/loading.dart';
import 'base/error_listening_screen.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

// createStateの型を修正
class _MapScreenState extends ConsumerState<MapScreen>
    with ErrorListeningMixin<MapScreen> {
  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    // searchNotifierProviderから状態をwatchする
    final state = ref.watch(searchResultsViewModelProvider);

    if (state.isLoading) {
      return const LoadingWidget();
    }
    if (state.places.isEmpty) {
      return Center(child: Text('search_results.not_found'.tr()));
    }

    // ここにGoogleMapウィジェットを配置するロジックを統合します。
    // state.places から緯度経度を取得してピンを配置できます。
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
        )
      ],
    ));
  }
}
