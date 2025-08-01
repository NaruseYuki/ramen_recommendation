// lib/views/screens/search_results_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

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
      ref
          .read(searchResultsViewModelProvider.notifier)
          .searchRamenPlaces(widget.ramenType);
    });
  }

  @override
  Widget build(BuildContext context) {
    setupErrorListener(ref);
    final locationState = ref.watch(searchResultsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('search_results.title'.tr(args: [widget.ramenType])),
      ),
      body: locationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : locationState.places.isEmpty
              ? Center(child: Text('search_results.not_found'.tr()))
              : ListView.builder(
                  itemCount: locationState.places.length,
                  itemBuilder: (context, index) {
                    final place = locationState.places[index] as RamenPlace;
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white),
                        child: ListTile(
                          title: Text(place.displayName.text),
                          subtitle: Text(place.address),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: AppColor.primary,
                              isScrollControlled: true,
                              // 全画面のボトムシートにする場合
                              useSafeArea: true,
                              // セーフエリアを考慮する場合
                              showDragHandle: true,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: PlaceDetailScreen(placeId: place.id),
                                );
                              },
                            );
                          },
                        ));
                  },
                ),
    );
  }
}
