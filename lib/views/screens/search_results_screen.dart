// lib/views/screens/search_results_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';

import 'ramen_list_screen.dart';

class SearchResultsScreen extends ConsumerStatefulWidget {
  final String ramenType;

  const SearchResultsScreen({super.key, required this.ramenType});

  @override
  ConsumerState<SearchResultsScreen> createState() =>
      _SearchResultsScreenState();
}

// ErrorListeningPageを継承
class _SearchResultsScreenState extends ConsumerState<SearchResultsScreen>
    with ErrorListeningMixin<SearchResultsScreen>, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState(); // ErrorListeningPageのinitStateを呼び出す
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(searchResultsViewModelProvider.notifier);
      viewModel.searchRamenPlaces(keyword: widget.ramenType);
    });
  }

  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    return Scaffold(
        appBar: AppBar(
          title: Text('search_results.title'.tr(args: [widget.ramenType])),
        ),
        body: RamenListScreen());
  }
}
