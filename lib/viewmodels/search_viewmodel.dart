import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../errors/app_error_code.dart';

part 'search_viewmodel.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  late final StateController<AppErrorCode?> _errorMessageController;

  @override
  RamenState build() {
    return RamenState();
  }
}
