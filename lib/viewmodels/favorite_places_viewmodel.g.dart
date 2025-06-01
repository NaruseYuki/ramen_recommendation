// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_places_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritePlacesViewModelHash() =>
    r'f6aa01a7a83b9354d5f5d2fe65ce67d2271d4caa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FavoritePlacesViewModel
    extends BuildlessAutoDisposeNotifier<RamenState> {
  late final DatabaseService databaseService;

  RamenState build(
    DatabaseService databaseService,
  );
}

/// See also [FavoritePlacesViewModel].
@ProviderFor(FavoritePlacesViewModel)
const favoritePlacesViewModelProvider = FavoritePlacesViewModelFamily();

/// See also [FavoritePlacesViewModel].
class FavoritePlacesViewModelFamily extends Family<RamenState> {
  /// See also [FavoritePlacesViewModel].
  const FavoritePlacesViewModelFamily();

  /// See also [FavoritePlacesViewModel].
  FavoritePlacesViewModelProvider call(
    DatabaseService databaseService,
  ) {
    return FavoritePlacesViewModelProvider(
      databaseService,
    );
  }

  @override
  FavoritePlacesViewModelProvider getProviderOverride(
    covariant FavoritePlacesViewModelProvider provider,
  ) {
    return call(
      provider.databaseService,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'favoritePlacesViewModelProvider';
}

/// See also [FavoritePlacesViewModel].
class FavoritePlacesViewModelProvider extends AutoDisposeNotifierProviderImpl<
    FavoritePlacesViewModel, RamenState> {
  /// See also [FavoritePlacesViewModel].
  FavoritePlacesViewModelProvider(
    DatabaseService databaseService,
  ) : this._internal(
          () => FavoritePlacesViewModel()..databaseService = databaseService,
          from: favoritePlacesViewModelProvider,
          name: r'favoritePlacesViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoritePlacesViewModelHash,
          dependencies: FavoritePlacesViewModelFamily._dependencies,
          allTransitiveDependencies:
              FavoritePlacesViewModelFamily._allTransitiveDependencies,
          databaseService: databaseService,
        );

  FavoritePlacesViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.databaseService,
  }) : super.internal();

  final DatabaseService databaseService;

  @override
  RamenState runNotifierBuild(
    covariant FavoritePlacesViewModel notifier,
  ) {
    return notifier.build(
      databaseService,
    );
  }

  @override
  Override overrideWith(FavoritePlacesViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoritePlacesViewModelProvider._internal(
        () => create()..databaseService = databaseService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databaseService: databaseService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FavoritePlacesViewModel, RamenState>
      createElement() {
    return _FavoritePlacesViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoritePlacesViewModelProvider &&
        other.databaseService == databaseService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseService.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FavoritePlacesViewModelRef on AutoDisposeNotifierProviderRef<RamenState> {
  /// The parameter `databaseService` of this provider.
  DatabaseService get databaseService;
}

class _FavoritePlacesViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<FavoritePlacesViewModel,
        RamenState> with FavoritePlacesViewModelRef {
  _FavoritePlacesViewModelProviderElement(super.provider);

  @override
  DatabaseService get databaseService =>
      (origin as FavoritePlacesViewModelProvider).databaseService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
