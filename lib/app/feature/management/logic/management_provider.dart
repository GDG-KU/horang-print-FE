import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/management/logic/management_state.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';
import 'package:horang_print/app/model/session_history.dart';
import 'package:horang_print/app/provider/printer_provider.dart';

final managementProvider =
    NotifierProvider<ManagementNotifier, ManagementState>(
  ManagementNotifier.new,
);

class ManagementNotifier extends Notifier<ManagementState> {
  Map<String, Uint8List> _imageCache = {};

  @override
  build() {
    return ManagementState(sessionHistories: []);
  }

  void getSessionHistories() async {
    final res = await ApiService.I.getSessionHistories();
    res.fold(
      onSuccess: (data) {
        state = state.copyWith(sessionHistories: data);
      },
      onFailure: (error) {
        log("Failed to fetch session histories: $error");
      },
    );
  }

  void reprint(SessionHistory history) async {
    if (state.isPrinting) return;
    state = state.copyWith(isPrinting: true);
    if (history.qr.target_url.isEmpty) {
      log("No image URL found for session history: ${history.uuid}");
      return;
    }
    final image = history.qr.target_url;
    if (_imageCache.containsKey(image)) {
      final cachedImage = await processImage(
        _imageCache[image]!,
        needCrop: true,
        brightnessFactor: ref.read(printOutputProvider).brightnessFactor,
        contrastFactor: ref.read(printOutputProvider).contrastFactor,
      );
      await ref.read(printerProvider.notifier).printImage(cachedImage);

      state = state.copyWith(isPrinting: false);
      return;
    } else {
      final res = await ApiService.I.fetchImageAsBytes(image);
      res.fold(
        onSuccess: (imageBytes) async {
          // _imageCache[image] = await processImage(imageBytes, needCrop: true);
          // await ref.read(printerProvider.notifier).printImage(
          //       _imageCache[image]!,
          //     );
          _imageCache[image] = imageBytes;
          final cachedImage = await processImage(
            _imageCache[image]!,
            needCrop: true,
            brightnessFactor: ref.read(printOutputProvider).brightnessFactor,
            contrastFactor: ref.read(printOutputProvider).contrastFactor,
          );
          await ref.read(printerProvider.notifier).printImage(cachedImage);
        },
        onFailure: (error) {
          log("Failed to fetch image for reprint: $error");
        },
      );
      state = state.copyWith(isPrinting: false);
    }
  }
}
