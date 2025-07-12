// lib/services/tflite_service.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:developer'; //log()を使用するために追加

import '../errors/app_error_code.dart';
import '../repositories/result.dart';

class TFLiteService {
  Interpreter? _interpreter;
  List<String>? _labels;
  static final TFLiteService _instance = TFLiteService._internal();

  factory TFLiteService() {
    return _instance;
  }

  TFLiteService._internal();

  /// モデルとラベルをロード
  Future<Result<void, AppErrorCode>> loadModel() async {
    try {
      // モデルをロード
      _interpreter =
      await Interpreter.fromAsset('assets/ramen_model.tflite'); // モデルのパスを指定

      // ラベルをロード
      final labelsData = await rootBundle
          .loadString('assets/ramen_model_labels.txt'); // ラベルファイルのパスを指定
      _labels = labelsData.split('\n');
      return const Success(null); // 成功した場合はnullを返す
    } catch (e) {
      return Failure(AppErrorCode.tensorFlowLiteLoadFailed());
    }
  }

  /// 画像分類を実行
  Future<Result<String, AppErrorCode>> classifyImage(File image) async {
    if (_interpreter == null || _labels == null) {
      return Failure(AppErrorCode.tensorFlowLiteLoadFailed());
    }

    try {
      // 画像を読み込み、モデルの入力形式に変換
      final inputImage = img.decodeImage(image.readAsBytesSync())!;
      final resizedImage =
          img.copyResize(inputImage, width: 224, height: 224); // モデルの入力サイズに合わせる

      // 画像データをUint8Listに変換
      final inputBuffer = Uint8List(224 * 224 * 3);
      for (int y = 0; y < resizedImage.height; y++) {
        for (int x = 0; x < resizedImage.width; x++) {
          final pixel = resizedImage.getPixel(x, y);
          final index = (y * resizedImage.width + x) * 3;
          inputBuffer[index] = pixel.r.toInt();
          inputBuffer[index + 1] = pixel.g.toInt();
          inputBuffer[index + 2] = pixel.b.toInt();
        }
      }
      final inputTensor = _interpreter!.getInputTensor(0);
      final inputShape = inputTensor.shape;

      final reshapedInput = inputBuffer.reshape(inputShape);

      // 推論の実行
      final outputShape = _interpreter!.getOutputTensor(0).shape;
      final outputBuffer =
          Float32List(outputShape.reduce((a, b) => a * b)).reshape(outputShape);
      _interpreter!.run(reshapedInput, outputBuffer);

      log('outputBuffer: ${outputBuffer.toList()}');

      // 結果を解釈
      final output = outputBuffer[0].toList();
      // outputが空でないことを確認
      if (output.isEmpty) {
        return Failure(AppErrorCode.tensorFlowLiteUnknownError());
      }
      final maxIndex = output.indexOf(
          output.reduce((int curr, int next) => curr > next ? curr : next));

      // maxIndexが_labelsの範囲内にあることを確認
      if (maxIndex < 0 || maxIndex >= _labels!.length) {
        return Failure(AppErrorCode.tensorFlowLiteUnknownError());
      }
      return Success(_labels![maxIndex]);
    } catch (e) {
      return Failure(AppErrorCode.tensorFlowLiteUnknownError());
    }
  }

  void dispose() {
    _interpreter?.close();
  }
}