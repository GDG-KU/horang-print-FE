import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_state.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:horang_print/app/provider/printer_provider.dart';
import 'package:image/image.dart';

final printOutputProvider =
    StateNotifierProvider<PrintOutputNotifier, PrintOutputState>((ref) {
  return PrintOutputNotifier();
});

class PrintOutputNotifier extends StateNotifier<PrintOutputState> {
  PrintOutputNotifier() : super(const PrintOutputState());

  final GlobalKey renderTargetKey = GlobalKey();

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
    for (int i = 0; i < state.printQuantity; i++) {
      ref.read(printerProvider.notifier).printImage(state.capturedImage!);
      await Future.delayed(const Duration(seconds: 2));
      log('Printing copy ${i + 1} of ${state.printQuantity}');
    }

    state = state.copyWith(isPrinting: false);
  }

  void reset() {
    state = const PrintOutputState();
  }

  Future<void> captureRenderTarget() async {
    try {
      if (renderTargetKey.currentContext == null) {
        log('Render target context is null');
        return;
      }
      RenderRepaintBoundary boundary = renderTargetKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image renderedImage = await boundary.toImage(pixelRatio: 3.0);

      ByteData? byteData = await renderedImage.toByteData(
        format: ui.ImageByteFormat.png,
      );

      Image image = decodeImage(byteData!.buffer.asUint8List())!;
      image = grayscale(image);

      image = copyResize(image, width: 576);
      image = ditherImage(
        image,
        quantizer: NeuralQuantizer(image, numberOfColors: 2),
      );
      Uint8List bmpData = encodeBmp(image);
      state = state.copyWith(capturedImage: bmpData);
    } catch (e) {
      log('Error capturing render target: $e');
    }
  }
}
