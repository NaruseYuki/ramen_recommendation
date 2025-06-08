// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_classification_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageClassificationViewModelHash() =>
    r'8cb33f60e75461f4f4000b64da8e1ce80125ebf8';

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

abstract class _$ImageClassificationViewModel
    extends BuildlessAutoDisposeNotifier<RamenState> {
  late final TFLiteService tfliteService;
  late final ImagePickerService imagePickerService;

  RamenState build(
    TFLiteService tfliteService,
    ImagePickerService imagePickerService,
  );
}

/// See also [ImageClassificationViewModel].
@ProviderFor(ImageClassificationViewModel)
const imageClassificationViewModelProvider =
    ImageClassificationViewModelFamily();

/// See also [ImageClassificationViewModel].
class ImageClassificationViewModelFamily extends Family<RamenState> {
  /// See also [ImageClassificationViewModel].
  const ImageClassificationViewModelFamily();

  /// See also [ImageClassificationViewModel].
  ImageClassificationViewModelProvider call(
    TFLiteService tfliteService,
    ImagePickerService imagePickerService,
  ) {
    return ImageClassificationViewModelProvider(
      tfliteService,
      imagePickerService,
    );
  }

  @override
  ImageClassificationViewModelProvider getProviderOverride(
    covariant ImageClassificationViewModelProvider provider,
  ) {
    return call(
      provider.tfliteService,
      provider.imagePickerService,
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
  String? get name => r'imageClassificationViewModelProvider';
}

/// See also [ImageClassificationViewModel].
class ImageClassificationViewModelProvider
    extends AutoDisposeNotifierProviderImpl<ImageClassificationViewModel,
        RamenState> {
  /// See also [ImageClassificationViewModel].
  ImageClassificationViewModelProvider(
    TFLiteService tfliteService,
    ImagePickerService imagePickerService,
  ) : this._internal(
          () => ImageClassificationViewModel()
            ..tfliteService = tfliteService
            ..imagePickerService = imagePickerService,
          from: imageClassificationViewModelProvider,
          name: r'imageClassificationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageClassificationViewModelHash,
          dependencies: ImageClassificationViewModelFamily._dependencies,
          allTransitiveDependencies:
              ImageClassificationViewModelFamily._allTransitiveDependencies,
          tfliteService: tfliteService,
          imagePickerService: imagePickerService,
        );

  ImageClassificationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tfliteService,
    required this.imagePickerService,
  }) : super.internal();

  final TFLiteService tfliteService;
  final ImagePickerService imagePickerService;

  @override
  RamenState runNotifierBuild(
    covariant ImageClassificationViewModel notifier,
  ) {
    return notifier.build(
      tfliteService,
      imagePickerService,
    );
  }

  @override
  Override overrideWith(ImageClassificationViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImageClassificationViewModelProvider._internal(
        () => create()
          ..tfliteService = tfliteService
          ..imagePickerService = imagePickerService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tfliteService: tfliteService,
        imagePickerService: imagePickerService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ImageClassificationViewModel, RamenState>
      createElement() {
    return _ImageClassificationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageClassificationViewModelProvider &&
        other.tfliteService == tfliteService &&
        other.imagePickerService == imagePickerService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tfliteService.hashCode);
    hash = _SystemHash.combine(hash, imagePickerService.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ImageClassificationViewModelRef
    on AutoDisposeNotifierProviderRef<RamenState> {
  /// The parameter `tfliteService` of this provider.
  TFLiteService get tfliteService;

  /// The parameter `imagePickerService` of this provider.
  ImagePickerService get imagePickerService;
}

class _ImageClassificationViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ImageClassificationViewModel,
        RamenState> with ImageClassificationViewModelRef {
  _ImageClassificationViewModelProviderElement(super.provider);

  @override
  TFLiteService get tfliteService =>
      (origin as ImageClassificationViewModelProvider).tfliteService;
  @override
  ImagePickerService get imagePickerService =>
      (origin as ImageClassificationViewModelProvider).imagePickerService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
