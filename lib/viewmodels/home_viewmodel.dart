import 'dart:developer';
import 'dart:io';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';
import 'package:permission_handler/permission_handler.dart';

import '../repositories/result.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final TFLiteService _tfliteService;
  late final ImagePickerService _imagePickerService;

  @override
  RamenState build() {
    _tfliteService = ref.watch(tfliteServiceProvider);
    _imagePickerService = ref.watch(imagePickerServiceProvider);
    return RamenState();
  }
  /// モデルのロード
  Future<void> loadModel() async {
    final result = await _tfliteService.loadModel(); // Result型を受け取る
    if (result is Failure<void, AppErrorCode>) {
      log('Model loading failed: ${result.exception}');
      state = state.copyWith(error: result.exception);
    }
  }

  /// ギャラリーから画像を選択（権限リクエスト込み）
  Future<void> pickImageFromGalleryWithPermission() async {
    if (await requestGalleryPermission()) {
      await pickImageFromGallery();
    } else {
      state = state.copyWith(error: AppErrorCode.galleryPermissionDenied());
    }
  }

  /// カメラで画像を撮影（権限リクエスト込み）
  Future<void> pickImageFromCameraWithPermission() async {
    if (await requestCameraPermission()) {
      await pickImageFromCamera();
    } else {
      state = state.copyWith(error: AppErrorCode.cameraPermissionDenied());
    }
  }

  /// ギャラリーから画像を選択
  Future<void> pickImageFromGallery() async {
    final result = await _imagePickerService.pickImageFromGallery(); // Result型を受け取る
    if (result is Success<File?, AppErrorCode>) {
      if (result.value != null) {
        state = state.copyWith(imageFile: result.value);
        await classifyImage(result.value);
      }
    } else if (result is Failure<File?, AppErrorCode>) {
      state = state.copyWith(error: result.exception);
    } else {
      state = state.copyWith(error: AppErrorCode.commonSystemError());
    }
  }

  /// カメラで画像を撮影
  Future<void> pickImageFromCamera() async {
    final result = await _imagePickerService.pickImageFromCamera(); // Result型を受け取る
    if (result is Success<File?, AppErrorCode>) {
      if (result.value != null) {
        state = state.copyWith(imageFile: result.value);
        await classifyImage(result.value);
      }
    } else if (result is Failure<File?, AppErrorCode>) {
      state = state.copyWith(error: result.exception);
    } else {
      state = state.copyWith(error: AppErrorCode.commonSystemError());
    }
  }

  /// 画像分類を実行
  Future<void> classifyImage(File? imageFile) async {
    state = state.copyWith(isLoading: true);
    if (imageFile == null) {
      state = state.copyWith(error: AppErrorCode.imageUnknownError(), isLoading: false);
      return;
    }
    final result = await _tfliteService.classifyImage(imageFile); // Result型を受け取る

    if (result is Success<String, AppErrorCode>) {
      state = state.copyWith(result: result.value, isLoading: false);
    } else if (result is Failure<String, AppErrorCode>) {
      state = state.copyWith(error: result.exception, isLoading: false);
    } else {
      state = state.copyWith(error: AppErrorCode.commonSystemError(), isLoading: false);
    }
  }
  /// カメラ権限リクエスト
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  /// ギャラリー権限リクエスト
  Future<bool> requestGalleryPermission() async {
    // Android 13以降はREAD_MEDIA_IMAGES、それ未満はREAD_EXTERNAL_STORAGE
    if (await Permission.photos.isGranted ||
        await Permission.photos.request().isGranted) {
      return true;
    }
    if (await Permission.storage.isGranted ||
        await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  stateInitialize() {
    loadModel();
  }

  stateClear() {
    state = state.initialize();
  }
}