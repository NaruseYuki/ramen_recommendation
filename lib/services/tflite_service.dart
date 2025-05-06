// lib/services/tflite_service.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:developer'; //log()を使用するために追加

import '../errors/app_error_code.dart';

class TFLiteService {
  Interpreter? _interpreter;
  List<String>? _labels;

  /// モデルとラベルをロード
  Future<void> loadModel() async {
    try {
      // モデルをロード
      _interpreter =
          await Interpreter.fromAsset('assets/ramen_model.tflite'); // モデルのパスを指定

      // ラベルをロード
      final labelsData = await rootBundle
          .loadString('assets/ramen_model_labels.txt'); // ラベルファイルのパスを指定
      _labels = labelsData.split('\n');
    } catch (e) {
      throw AppErrorCode.tensorFlowLiteLoadFailed();
    }
  }

  /// 画像分類を実行
  Future<String> classifyImage(File image) async {
    if (_interpreter == null || _labels == null) {
      throw AppErrorCode.tensorFlowLiteLoadFailed();
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

      //推論の実行
      final outputShape = _interpreter!.getOutputTensor(0).shape;
      final outputBuffer =
          Float32List(outputShape.reduce((a, b) => a * b)).reshape(outputShape);
      _interpreter!.run(reshapedInput, outputBuffer);

      log('outputBuffer: ${outputBuffer.toList()}');

      // 結果を解釈
      final output = outputBuffer[0].toList();
      final maxIndex = output.indexOf(
          output.reduce((int curr, int next) => curr > next ? curr : next));
      return _labels![maxIndex];
    } catch (e) {
      throw AppErrorCode.tensorFlowLiteUnknownError();
    }
  }

  void dispose() {
    _interpreter?.close();
  }
}
