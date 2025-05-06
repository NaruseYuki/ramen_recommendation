import 'package:flutter_test/flutter_test.dart';
import 'package:ramen_recommendation/viewmodels/ramen_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ramen_recommendation/services/database_service.dart';

import 'ramen_viewmodel_test.mocks.dart';

@GenerateMocks([DatabaseService])
void main() {
  group('RamenViewModel', () {
    late RamenViewModel viewModel;
    late MockDatabaseService mockDatabaseService;

    setUp(() {
      mockDatabaseService = MockDatabaseService();
      viewModel = RamenViewModel();
      viewModel.databaseService = mockDatabaseService; // セッターを使用
    });

    test('toggleFavorite adds a place to favorites if not already added',
        () async {
      final place = {
        'place_id': '123',
        'name': 'Test Ramen Shop',
        'vicinity': 'Test Address'
      };

      when(mockDatabaseService.addFavoriteShop(place)).thenAnswer((_) async {});

      viewModel.toggleFavorite(place);

      expect(viewModel.state.favoritePlaceIds.contains('123'), true);
      verify(mockDatabaseService.addFavoriteShop(place)).called(1);
    });

    test('toggleFavorite removes a place from favorites if already added',
        () async {
      final place = {
        'place_id': '123',
        'name': 'Test Ramen Shop',
        'vicinity': 'Test Address'
      };
      viewModel.state = viewModel.state.copyWith(favoritePlaceIds: {'123'});

      when(mockDatabaseService.removeFavoriteShop('123'))
          .thenAnswer((_) async {});

      viewModel.toggleFavorite(place);

      expect(viewModel.state.favoritePlaceIds.contains('123'), false);
      verify(mockDatabaseService.removeFavoriteShop('123')).called(1);
    });
  });
}
