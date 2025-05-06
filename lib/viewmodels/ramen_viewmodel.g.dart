// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ramen_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ramenViewModelHash() => r'e1048e70d2f7257eaf333b6a1da6c5446934741b';

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

abstract class _$RamenViewModel
    extends BuildlessAutoDisposeNotifier<RamenState> {
  late final PlacesRepositoryInterface placesRepository;

  RamenState build(
    PlacesRepositoryInterface placesRepository,
  );
}

/// See also [RamenViewModel].
@ProviderFor(RamenViewModel)
const ramenViewModelProvider = RamenViewModelFamily();

/// See also [RamenViewModel].
class RamenViewModelFamily extends Family<RamenState> {
  /// See also [RamenViewModel].
  const RamenViewModelFamily();

  /// See also [RamenViewModel].
  RamenViewModelProvider call(
    PlacesRepositoryInterface placesRepository,
  ) {
    return RamenViewModelProvider(
      placesRepository,
    );
  }

  @override
  RamenViewModelProvider getProviderOverride(
    covariant RamenViewModelProvider provider,
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
  String? get name => r'ramenViewModelProvider';
}

/// See also [RamenViewModel].
class RamenViewModelProvider
    extends AutoDisposeNotifierProviderImpl<RamenViewModel, RamenState> {
  /// See also [RamenViewModel].
  RamenViewModelProvider(
    PlacesRepositoryInterface placesRepository,
  ) : this._internal(
          () => RamenViewModel()..placesRepository = placesRepository,
          from: ramenViewModelProvider,
          name: r'ramenViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ramenViewModelHash,
          dependencies: RamenViewModelFamily._dependencies,
          allTransitiveDependencies:
              RamenViewModelFamily._allTransitiveDependencies,
          placesRepository: placesRepository,
        );

  RamenViewModelProvider._internal(
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
    covariant RamenViewModel notifier,
  ) {
    return notifier.build(
      placesRepository,
    );
  }

  @override
  Override overrideWith(RamenViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RamenViewModelProvider._internal(
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
  AutoDisposeNotifierProviderElement<RamenViewModel, RamenState>
      createElement() {
    return _RamenViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RamenViewModelProvider &&
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
mixin RamenViewModelRef on AutoDisposeNotifierProviderRef<RamenState> {
  /// The parameter `placesRepository` of this provider.
  PlacesRepositoryInterface get placesRepository;
}

class _RamenViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<RamenViewModel, RamenState>
    with RamenViewModelRef {
  _RamenViewModelProviderElement(super.provider);

  @override
  PlacesRepositoryInterface get placesRepository =>
      (origin as RamenViewModelProvider).placesRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
