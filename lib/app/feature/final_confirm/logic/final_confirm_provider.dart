import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_state.dart';

final finalConfirmProvider =
    NotifierProvider<FinalConfirmNotifier, FinalConfirmState>(
  FinalConfirmNotifier.new,
);

class FinalConfirmNotifier extends Notifier<FinalConfirmState> {
  @override
  FinalConfirmState build() {
    return const FinalConfirmState();
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
      onSuccess: (_) {
        state = state.copyWith();
      },
      onFailure: (error) {
        state = state.copyWith(
          error: error.message,
        );
      },
    );
  }

  void reset() {
    state = const FinalConfirmState();
  }
}
