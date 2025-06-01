import 'dart:io';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/state/ramen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../errors/app_error_code.dart';

part 'image_classification_viewmodel.g.dart';

@riverpod
class ImageClassificationViewModel extends _$ImageClassificationViewModel {
  late final TFLiteService _tfliteService;
  late final ImagePickerService _imagePickerService;

  @override
  RamenState build(
      TFLiteService tfliteService, ImagePickerService imagePickerService) {
    _tfliteService = tfliteService;
    _imagePickerService = imagePickerService;
    return RamenState();
  }

  /// モデルのロード
  Future<void> loadModel() async {
    try {
      await _tfliteService.loadModel();
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// ギャラリーから画像を選択
  Future<void> pickImageFromGallery() async {
    try {
      final imageFile = await _imagePickerService.pickImageFromGallery();
      if (imageFile != null) {
        state = state.copyWith(imageFile: imageFile);
        await classifyImage(imageFile);
      }
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// カメラで画像を撮影
  Future<void> pickImageFromCamera() async {
    try {
      final imageFile = await _imagePickerService.pickImageFromCamera();
      if (imageFile != null) {
        state = state.copyWith(imageFile: imageFile);
        await classifyImage(imageFile);
      }
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// 画像分類を実行
  Future<void> classifyImage(File imageFile) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _tfliteService.classifyImage(imageFile);
      state = state.copyWith(result: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode, isLoading: false);
    }
  }
}
