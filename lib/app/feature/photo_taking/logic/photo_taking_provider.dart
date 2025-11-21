import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_state.dart';
import 'package:image/image.dart' as img;

final photoTakingProvider =
    StateNotifierProvider<PhotoTakingNotifier, PhotoTakingState>((ref) {
  return PhotoTakingNotifier();
});

class PhotoTakingNotifier extends StateNotifier<PhotoTakingState> {
  Timer? _countdownTimer;

  PhotoTakingNotifier() : super(const PhotoTakingState());

  double calculateDottedBoxSize(BuildContext context) {
    return state.cameraController!.value.previewSize!.height *
        (context.width / state.cameraController!.value.previewSize!.width);
  }

  Future<void> initCamera({
    required Size photoSize,
  }) async {
    try {
      state = state.copyWith(isInitializing: true);

      final cameras = await availableCameras();

      // Find front camera
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        frontCamera,
        ResolutionPreset.veryHigh,
        enableAudio: false,
      );

      await controller.initialize();

      controller.value = controller.value.copyWith(
        previewPauseOrientation: Optional.of(DeviceOrientation.landscapeLeft),
        lockedCaptureOrientation: Optional.of(DeviceOrientation.landscapeLeft),
        deviceOrientation: DeviceOrientation.landscapeLeft,
        exposureMode: ExposureMode.auto,
        focusMode: FocusMode.auto,
      );

      state = state.copyWith(
        cameraController: controller,
        isCameraReady: true,
        isInitializing: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to initialize camera: $e',
        isInitializing: false,
      );
    }
  }

  Future<void> startCapture() async {
    if (state.isCountingDown || state.isCapturing) return;

    state = state.copyWith(isCountingDown: true, countdown: 3);

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newCount = state.countdown - 1;

      if (newCount <= 0) {
        timer.cancel();
        _capture();
      } else {
        state = state.copyWith(countdown: newCount);
      }
    });
  }

  Future<void> _capture() async {
    state = state.copyWith(
      isCountingDown: false,
      isCapturing: true,
    );

    try {
      final controller = state.cameraController;
      if (controller == null || !controller.value.isInitialized) {
        throw Exception('Camera not initialized');
      }

      final image = await controller.takePicture();
      final imageBytes = await image.readAsBytes();
      final originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) return;
      final flippedImage = img.flipHorizontal(originalImage);
      final finalBytes = img.encodePng(flippedImage);

      state = state.copyWith(
        isCapturing: false,
        capturedImage: finalBytes,
      );
    } catch (e) {
      state = state.copyWith(
        isCapturing: false,
        errorMessage: 'Failed to capture photo: $e',
      );
    }
  }

  void reset() {
    _countdownTimer?.cancel();
    state.cameraController?.dispose();
    state = const PhotoTakingState();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    state.cameraController?.dispose();
    super.dispose();
  }
}
