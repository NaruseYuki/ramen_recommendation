// lib/services/image_picker_service.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../errors/app_error_code.dart';
import '../repositories/result.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  /// ギャラリーから画像を取得
  Future<Result<File?, AppErrorCode>> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return Success(File(pickedFile.path));
      }
      return const Success(null); // ファイルが選択されなかった場合はnullを返す
    } catch (e) {
      // エラーハンドリング
      return Failure(AppErrorCode.imageUnknownError());
    }
  }

  /// カメラで画像を撮影
  Future<Result<File?, AppErrorCode>> pickImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return Success(File(pickedFile.path));
      }
      return const Success(null); // ファイルが撮影されなかった場合はnullを返す
    } catch (e) {
      // エラーハンドリング
      return Failure(AppErrorCode.imageUnknownError());
    }
  }
}