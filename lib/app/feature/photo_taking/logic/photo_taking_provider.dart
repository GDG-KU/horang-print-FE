import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_state.dart';

final photoTakingProvider =
    StateNotifierProvider<PhotoTakingNotifier, PhotoTakingState>((ref) {
  return PhotoTakingNotifier();
});

class PhotoTakingNotifier extends StateNotifier<PhotoTakingState> {
  Timer? _countdownTimer;

  PhotoTakingNotifier() : super(const PhotoTakingState());

  void initCamera() {
    state = state.copyWith(isCameraReady: true);
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

  void _capture() async {
    state = state.copyWith(
      isCountingDown: false,
      isCapturing: true,
    );

    await Future.delayed(const Duration(milliseconds: 500));

    final mockImageData = Uint8List(100);

    state = state.copyWith(
      isCapturing: false,
      capturedImage: mockImageData,
    );
  }

  void reset() {
    _countdownTimer?.cancel();
    state = const PhotoTakingState();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}