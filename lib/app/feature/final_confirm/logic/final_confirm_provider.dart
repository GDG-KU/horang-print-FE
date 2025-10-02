import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_state.dart';

final finalConfirmProvider =
    StateNotifierProvider<FinalConfirmNotifier, FinalConfirmState>((ref) {
  return FinalConfirmNotifier()..processImage();
});

class FinalConfirmNotifier extends StateNotifier<FinalConfirmState> {
  FinalConfirmNotifier() : super(const FinalConfirmState());

  Future<void> processImage() async {
    state = state.copyWith(isProcessing: true);

    await Future.delayed(const Duration(seconds: 3));

    final mockTransformedImage = Uint8List(100);
    const mockDownloadUrl = 'https://example.com/image/12345';
    const mockQrData = 'https://example.com/download/12345';

    state = state.copyWith(
      isProcessing: false,
      transformedImage: mockTransformedImage,
      downloadUrl: mockDownloadUrl,
      qrCodeData: mockQrData,
    );
  }

  void reset() {
    state = const FinalConfirmState();
  }
}