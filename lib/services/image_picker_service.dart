// lib/services/image_picker_service.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../errors/app_error_code.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  /// ギャラリーから画像を取得
  Future<File?> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      // エラーハンドリング
      throw AppErrorCode.imageUnknownError();
    }
  }

  /// カメラで画像を撮影
  Future<File?> pickImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      // エラーハンドリング
      throw AppErrorCode.imageUnknownError();
    }
  }
}
