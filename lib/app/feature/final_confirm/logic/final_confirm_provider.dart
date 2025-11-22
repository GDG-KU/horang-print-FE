import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_state.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_provider.dart';
import 'package:image/image.dart' as img;

final finalConfirmProvider =
    NotifierProvider<FinalConfirmNotifier, FinalConfirmState>(
  FinalConfirmNotifier.new,
);

class FinalConfirmNotifier extends Notifier<FinalConfirmState> {
  @override
  FinalConfirmState build() {
    return const FinalConfirmState();
  }

  Future<void> testCompress(Uint8List imageByte) async {
    final double originalSizeMB = imageByte.length / (1024 * 1024);
    print('압축 전 크기: ${originalSizeMB.toStringAsFixed(2)} MB');

    img.Image? image = img.decodeImage(imageByte);

    if (image == null) {
      print('이미지 디코딩 실패');
      return;
    }

    img.Image resized = img.copyResize(
      image,
      width: (image.width * 0.7).round(),
      height: (image.height * 0.7).round(),
      interpolation: img.Interpolation.linear,
    );

    Uint8List compressedBytes =
        Uint8List.fromList(img.encodePng(resized, level: 6));

    final double compressedSizeMB = compressedBytes.length / (1024 * 1024);
    print('압축 후 크기: ${compressedSizeMB.toStringAsFixed(2)} MB');
    print(
        '압축률: ${((1 - compressedSizeMB / originalSizeMB) * 100).toStringAsFixed(1)}%');
    ref.read(photoTakingProvider.notifier).setCompressedImage(compressedBytes);
  }

  Future<void> submitOriginalImage(
    Uint8List imageByte,
    String sessionUuid,
  ) async {
    state = state.copyWith(
      originalImage: imageByte,
    );

    log('Submitting original image, session UUID: $sessionUuid, size: ${imageByte.lengthInBytes} bytes');

    final result = await ApiService.I.submitOriginalImage(
      imageByte,
      sessionUuid,
    );

    result.fold(
      onSuccess: (_) {},
      onFailure: (error) {
        state = state.copyWith(
          error: error.message,
        );
      },
    );
  }

  void setAIImageUrl(String imageUrl) {
    state = state.copyWith(
      ai_image_url: imageUrl,
    );
  }

  void reset() {
    state = const FinalConfirmState();
  }
}
