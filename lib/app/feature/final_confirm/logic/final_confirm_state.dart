import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'final_confirm_state.freezed.dart';

@freezed
class FinalConfirmState with _$FinalConfirmState {
  const factory FinalConfirmState({
    @Default(true) bool isProcessing,
    Uint8List? transformedImage,
    String? downloadUrl,
    String? qrCodeData,
    String? error,
  }) = _FinalConfirmState;
}