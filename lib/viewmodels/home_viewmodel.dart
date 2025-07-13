// lib/viewmodels/home_viewmodel.dart
import 'dart:developer';
import 'dart:io';
import 'package:ramen_recommendation/api/providers/service_providers.dart'; // errorMessageProviderをインポート
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // StateControllerをインポートするために必要

import '../repositories/result.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final TFLiteService _tfliteService;
  late final ImagePickerService _imagePickerService;
  late final StateController<AppErrorCode?> _errorMessageController;

  @override
  RamenState build() {
    _tfliteService = ref.watch(tfliteServiceProvider);
    _imagePickerService = ref.watch(imagePickerServiceProvider);
    _errorMessageController = ref.read(errorMessageProvider.notifier);
    return RamenState();
  }

  /// モデルのロード
  Future<void> loadModel() async {
    final result = await _tfliteService.loadModel();
    if (result is Failure<void, AppErrorCode>) {
      log('Model loading failed: ${result.exception}');
      _errorMessageController.state = result.exception; 
    }
  }

  /// ギャラリーから画像を選択（権限リクエスト込み）
  Future<void> pickImageFromGalleryWithPermission() async {
    if (await requestGalleryPermission()) {
      await pickImageFromGallery();
    } else {
      _errorMessageController.state = AppErrorCode.galleryPermissionDenied(); 
    }
  }

  /// カメラで画像を撮影（権限リクエスト込み）
  Future<void> pickImageFromCameraWithPermission() async {
    if (await requestCameraPermission()) {
      await pickImageFromCamera();
    } else {
      _errorMessageController.state = AppErrorCode.cameraPermissionDenied(); 
    }
  }

  /// ギャラリーから画像を選択
  Future<void> pickImageFromGallery() async {
    final result = await _imagePickerService.pickImageFromGallery();
    if (result is Success<File?, AppErrorCode>) {
      if (result.value != null) {
        state = state.copyWith(imageFile: result.value);
        await classifyImage(result.value);
      }
    } else if (result is Failure<File?, AppErrorCode>) {
      _errorMessageController.state = result.exception; 
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError(); 
    }
  }

  /// カメラで画像を撮影
  Future<void> pickImageFromCamera() async {
    final result = await _imagePickerService.pickImageFromCamera();
    if (result is Success<File?, AppErrorCode>) {
      if (result.value != null) {
        state = state.copyWith(imageFile: result.value);
        await classifyImage(result.value);
      }
    } else if (result is Failure<File?, AppErrorCode>) {
      _errorMessageController.state = result.exception; 
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError();
    }
  }

  /// 画像分類を実行
  Future<void> classifyImage(File? imageFile) async {
    state = state.copyWith(isLoading: true);
    if (imageFile == null) {
      _errorMessageController.state = AppErrorCode.imageUnknownError();
      state = state.copyWith(isLoading: false);
      return;
    }
    final result = await _tfliteService.classifyImage(imageFile);

    if (result is Success<String, AppErrorCode>) {
      state = state.copyWith(result: result.value, isLoading: false);
    } else if (result is Failure<String, AppErrorCode>) {
      _errorMessageController.state = result.exception; 
      state = state.copyWith(isLoading: false);
    } else {
      _errorMessageController.state = AppErrorCode.commonSystemError(); 
      state = state.copyWith(isLoading: false);
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