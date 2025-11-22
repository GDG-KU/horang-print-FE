import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_state.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:horang_print/app/provider/printer_provider.dart';
import 'package:image/image.dart';

final printOutputProvider =
    StateNotifierProvider<PrintOutputNotifier, PrintOutputState>((ref) {
  return PrintOutputNotifier();
});

Future<Uint8List> processImage(
  Uint8List imageBytes, {
  double contrastFactor = 1.25,
  double brightnessFactor = 1.05,
  bool needCrop = false,
}) async {
  Image decoded = decodeImage(imageBytes)!;
  Image forPrint = grayscale(decoded);
  if (needCrop) {
    forPrint = copyCrop(
      forPrint,
      x: 75,
      y: 75,
      width: forPrint.width - 150,
      height: forPrint.height - 150,
    );
  }
  Image croppedRegion =
      copyCrop(forPrint, x: 0, y: 1500, width: 1200, height: 1200);

  croppedRegion = adjustColor(
    croppedRegion,
    brightness: brightnessFactor,
    contrast: contrastFactor,
  );
  compositeImage(
    forPrint,
    croppedRegion,
    dstX: 0,
    dstY: 1500,
  );

  forPrint = copyResize(forPrint, width: 576);
  _applyAtkinsonDithering(forPrint);
  return encodeBmp(forPrint);
}

void _applyAtkinsonDithering(Image image) {
  final width = image.width;
  final height = image.height;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      Pixel pixel = image.getPixel(x, y);
      int oldPixel = pixel.r.toInt();

      int newPixel = oldPixel < 128 ? 0 : 255;

      image.setPixelRgb(x, y, newPixel, newPixel, newPixel);

      int error = oldPixel - newPixel;

      _distributeError(image, x + 1, y, error, 1 / 8);
      _distributeError(image, x + 2, y, error, 1 / 8);
      _distributeError(image, x - 1, y + 1, error, 1 / 8);
      _distributeError(image, x, y + 1, error, 1 / 8);
      _distributeError(image, x + 1, y + 1, error, 1 / 8);
      _distributeError(image, x, y + 2, error, 1 / 8);
    }
  }
}

void _distributeError(Image image, int x, int y, int error, double factor) {
  if (x < 0 || x >= image.width || y < 0 || y >= image.height) return;

  Pixel pixel = image.getPixel(x, y);
  int currentVal = pixel.r.toInt();

  // 오차를 더함
  int newVal = (currentVal + (error * factor)).round();

  newVal = math.max(0, math.min(255, newVal));

  image.setPixelRgb(x, y, newVal, newVal, newVal);
}

class PrintOutputNotifier extends StateNotifier<PrintOutputState> {
  PrintOutputNotifier() : super(const PrintOutputState());

  final GlobalKey renderTargetKey = GlobalKey();
  final GlobalKey previewTargetKey = GlobalKey();

  void increaseQuantity() {
    if (state.printQuantity < state.maxQuantity) {
      state = state.copyWith(printQuantity: state.printQuantity + 1);
    }
  }

  void decreaseQuantity() {
    if (state.printQuantity > state.minQuantity) {
      state = state.copyWith(printQuantity: state.printQuantity - 1);
    }
  }

  void setBrightnessFactor(double factor) {
    state = state.copyWith(brightnessFactor: factor);
  }

  void setContrastFactor(double factor) {
    state = state.copyWith(contrastFactor: factor);
  }

  Future<void> startPrinting(WidgetRef ref) async {
    state = state.copyWith(isPrinting: true);
    bool result = true;
    for (int i = 0; i < state.printQuantity; i++) {
      result = result &&
          await ref
              .read(printerProvider.notifier)
              .printImage(state.capturedImage!);
      await Future.delayed(const Duration(seconds: 6));
      log('Printing copy ${i + 1} of ${state.printQuantity}');
    }

    state = state.copyWith(isPrinting: false, isErrorOnPrinting: !result);
  }

  void reset() {
    state = state.copyWith(
      printQuantity: 1,
      isPrinting: false,
      isErrorOnPrinting: false,
      isCapturing: false,
      capturedImage: null,
      originalImage: null,
    );
  }

  void uploadReceiptImage(String sessionUuid) {
    ApiService.I.uploadReceiptImage(
      state.originalImage!,
      sessionUuid,
    );
  }

  Future<bool> captureRenderTarget() async {
    state = state.copyWith(isCapturing: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      if (renderTargetKey.currentContext == null) {
        log('Render target context is null');
        return false;
      }
      ByteData? byteData = await getBytesFromKey(renderTargetKey);
      ByteData? originalByteData = await getBytesFromKey(previewTargetKey);
      if (byteData == null || originalByteData == null) {
        log('Failed to get byte data from render target');
        return false;
      }

      final (origninal, bmpData) = (
        originalByteData.buffer.asUint8List(),
        await compute(
          processImage,
          byteData.buffer.asUint8List(),
        )
      );

      state = state.copyWith(
        originalImage: origninal,
        capturedImage: bmpData,
      );
      return true;
    } catch (e) {
      log('Error capturing render target: $e');
      return false;
    } finally {
      state = state.copyWith(isCapturing: false);
    }
  }

  Future<ByteData?> getBytesFromKey(GlobalKey key) async {
    if (key.currentContext == null) {
      log('Target context is null');
      return null;
    }
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image renderedImage = await boundary.toImage(pixelRatio: 3.0);

    ByteData? byteData = await renderedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return byteData;
  }
}
