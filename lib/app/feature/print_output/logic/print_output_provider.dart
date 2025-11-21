import 'dart:developer';

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

Future<Uint8List> _processImage(
  Uint8List imageBytes,
) async {
  Image decoded = decodeImage(imageBytes)!;
  Image forPrint = grayscale(decoded);
  forPrint = copyResize(forPrint, width: 576);
  forPrint = ditherImage(
    forPrint,
    quantizer: NeuralQuantizer(forPrint, numberOfColors: 2),
    kernel: DitherKernel.stucki,
  );

  return encodeBmp(forPrint);
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
    state = const PrintOutputState();
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
          _processImage,
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
