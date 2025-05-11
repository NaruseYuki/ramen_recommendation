// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationViewModelHash() => r'd763d1b4d250f13660ae7d22c8137c511c469636';

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

abstract class _$LocationViewModel
    extends BuildlessAutoDisposeNotifier<RamenState> {
  late final PlacesRepositoryInterface placesRepository;

  RamenState build(
    PlacesRepositoryInterface placesRepository,
  );
}

/// See also [LocationViewModel].
@ProviderFor(LocationViewModel)
const locationViewModelProvider = LocationViewModelFamily();

/// See also [LocationViewModel].
class LocationViewModelFamily extends Family<RamenState> {
  /// See also [LocationViewModel].
  const LocationViewModelFamily();

  /// See also [LocationViewModel].
  LocationViewModelProvider call(
    PlacesRepositoryInterface placesRepository,
  ) {
    return LocationViewModelProvider(
      placesRepository,
    );
  }

  @override
  LocationViewModelProvider getProviderOverride(
    covariant LocationViewModelProvider provider,
  ) {
    return call(
      provider.placesRepository,
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
  String? get name => r'locationViewModelProvider';
}

/// See also [LocationViewModel].
class LocationViewModelProvider
    extends AutoDisposeNotifierProviderImpl<LocationViewModel, RamenState> {
  /// See also [LocationViewModel].
  LocationViewModelProvider(
    PlacesRepositoryInterface placesRepository,
  ) : this._internal(
          () => LocationViewModel()..placesRepository = placesRepository,
          from: locationViewModelProvider,
          name: r'locationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationViewModelHash,
          dependencies: LocationViewModelFamily._dependencies,
          allTransitiveDependencies:
              LocationViewModelFamily._allTransitiveDependencies,
          placesRepository: placesRepository,
        );

  LocationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.placesRepository,
  }) : super.internal();

  final PlacesRepositoryInterface placesRepository;

  @override
  RamenState runNotifierBuild(
    covariant LocationViewModel notifier,
  ) {
    return notifier.build(
      placesRepository,
    );
  }

  @override
  Override overrideWith(LocationViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: LocationViewModelProvider._internal(
        () => create()..placesRepository = placesRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        placesRepository: placesRepository,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LocationViewModel, RamenState>
      createElement() {
    return _LocationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationViewModelProvider &&
        other.placesRepository == placesRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, placesRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocationViewModelRef on AutoDisposeNotifierProviderRef<RamenState> {
  /// The parameter `placesRepository` of this provider.
  PlacesRepositoryInterface get placesRepository;
}

class _LocationViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<LocationViewModel, RamenState>
    with LocationViewModelRef {
  _LocationViewModelProviderElement(super.provider);

  @override
  PlacesRepositoryInterface get placesRepository =>
      (origin as LocationViewModelProvider).placesRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
