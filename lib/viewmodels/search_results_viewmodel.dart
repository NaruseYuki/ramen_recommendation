import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:ramen_recommendation/api/requests/search_ramen_places_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';

part 'search_results_viewmodel.g.dart';

@riverpod
class SearchResultsViewModel extends _$SearchResultsViewModel {
  late final PlacesRepositoryInterface _placesRepository;
  @override
  RamenState build() {
    _placesRepository = ref.watch(placeDetailsRepositoryProvider);
    return RamenState();
  }

  Future<bool> searchRamenPlaces(String keyword, dynamic position) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _placesRepository.searchRamenPlaces(
        request: SearchRamenPlacesRequest(
          position: position,
          keyword: keyword,
        ),
      );
      state = state.copyWith(places: response.places, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.mapUnknownError(), isLoading: false);
      return false;
    }
  }
}
