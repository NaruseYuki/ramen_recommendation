// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appViewModelHash() => r'921439d6260577eded627ee80bc7b9bf006a6cf4';

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

abstract class _$AppViewModel extends BuildlessAutoDisposeNotifier<AppState> {
  late final ImageClassificationViewModelProvider imageClassificationProvider;
  late final LocationViewModelProvider locationProvider;
  late final FavoritePlacesViewModelProvider favoritePlacesProvider;

  AppState build(
    ImageClassificationViewModelProvider imageClassificationProvider,
    LocationViewModelProvider locationProvider,
    FavoritePlacesViewModelProvider favoritePlacesProvider,
  );
}

/// See also [AppViewModel].
@ProviderFor(AppViewModel)
const appViewModelProvider = AppViewModelFamily();

/// See also [AppViewModel].
class AppViewModelFamily extends Family<AppState> {
  /// See also [AppViewModel].
  const AppViewModelFamily();

  /// See also [AppViewModel].
  AppViewModelProvider call(
    ImageClassificationViewModelProvider imageClassificationProvider,
    LocationViewModelProvider locationProvider,
    FavoritePlacesViewModelProvider favoritePlacesProvider,
  ) {
    return AppViewModelProvider(
      imageClassificationProvider,
      locationProvider,
      favoritePlacesProvider,
    );
  }

  @override
  AppViewModelProvider getProviderOverride(
    covariant AppViewModelProvider provider,
  ) {
    return call(
      provider.imageClassificationProvider,
      provider.locationProvider,
      provider.favoritePlacesProvider,
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
  String? get name => r'appViewModelProvider';
}

/// See also [AppViewModel].
class AppViewModelProvider
    extends AutoDisposeNotifierProviderImpl<AppViewModel, AppState> {
  /// See also [AppViewModel].
  AppViewModelProvider(
    ImageClassificationViewModelProvider imageClassificationProvider,
    LocationViewModelProvider locationProvider,
    FavoritePlacesViewModelProvider favoritePlacesProvider,
  ) : this._internal(
          () => AppViewModel()
            ..imageClassificationProvider = imageClassificationProvider
            ..locationProvider = locationProvider
            ..favoritePlacesProvider = favoritePlacesProvider,
          from: appViewModelProvider,
          name: r'appViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appViewModelHash,
          dependencies: AppViewModelFamily._dependencies,
          allTransitiveDependencies:
              AppViewModelFamily._allTransitiveDependencies,
          imageClassificationProvider: imageClassificationProvider,
          locationProvider: locationProvider,
          favoritePlacesProvider: favoritePlacesProvider,
        );

  AppViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageClassificationProvider,
    required this.locationProvider,
    required this.favoritePlacesProvider,
  }) : super.internal();

  final ImageClassificationViewModelProvider imageClassificationProvider;
  final LocationViewModelProvider locationProvider;
  final FavoritePlacesViewModelProvider favoritePlacesProvider;

  @override
  AppState runNotifierBuild(
    covariant AppViewModel notifier,
  ) {
    return notifier.build(
      imageClassificationProvider,
      locationProvider,
      favoritePlacesProvider,
    );
  }

  @override
  Override overrideWith(AppViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppViewModelProvider._internal(
        () => create()
          ..imageClassificationProvider = imageClassificationProvider
          ..locationProvider = locationProvider
          ..favoritePlacesProvider = favoritePlacesProvider,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageClassificationProvider: imageClassificationProvider,
        locationProvider: locationProvider,
        favoritePlacesProvider: favoritePlacesProvider,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppViewModel, AppState> createElement() {
    return _AppViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppViewModelProvider &&
        other.imageClassificationProvider == imageClassificationProvider &&
        other.locationProvider == locationProvider &&
        other.favoritePlacesProvider == favoritePlacesProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageClassificationProvider.hashCode);
    hash = _SystemHash.combine(hash, locationProvider.hashCode);
    hash = _SystemHash.combine(hash, favoritePlacesProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppViewModelRef on AutoDisposeNotifierProviderRef<AppState> {
  /// The parameter `imageClassificationProvider` of this provider.
  ImageClassificationViewModelProvider get imageClassificationProvider;

  /// The parameter `locationProvider` of this provider.
  LocationViewModelProvider get locationProvider;

  /// The parameter `favoritePlacesProvider` of this provider.
  FavoritePlacesViewModelProvider get favoritePlacesProvider;
}

class _AppViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<AppViewModel, AppState>
    with AppViewModelRef {
  _AppViewModelProviderElement(super.provider);

  @override
  ImageClassificationViewModelProvider get imageClassificationProvider =>
      (origin as AppViewModelProvider).imageClassificationProvider;
  @override
  LocationViewModelProvider get locationProvider =>
      (origin as AppViewModelProvider).locationProvider;
  @override
  FavoritePlacesViewModelProvider get favoritePlacesProvider =>
      (origin as AppViewModelProvider).favoritePlacesProvider;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
