import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart' show RamenPlace;
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart';

import 'base/common/custom_list_view.dart';
import 'base/common/loading.dart';
import 'base/error_listening_screen.dart';

class RamenListScreen extends ConsumerStatefulWidget {
  const RamenListScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RamenListScreenState();
}

class _RamenListScreenState extends ConsumerState<RamenListScreen>
    with ErrorListeningMixin<RamenListScreen> {
  late SearchResultsViewModel viewModel;

  @override
  void initState() {
    super.initState(); // ErrorListeningPageのinitStateを呼び出す
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = ref.read(searchResultsViewModelProvider.notifier);
      viewModel.loadFavoriteShops();
    });
  }

  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    final state = ref.watch(searchResultsViewModelProvider);
    if (state.isLoading) {
      return LoadingWidget();
    }
    if (state.places.isEmpty) {
      return Center(child: Text('search_results.not_found'.tr()));
    }
    return customListView(state, (RamenPlace place) {
      viewModel.toggleFavorite(place);
    });
  }
}
