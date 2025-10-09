import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'final_confirm_state.freezed.dart';

@freezed
class FinalConfirmState with _$FinalConfirmState {
  const factory FinalConfirmState({
    Uint8List? originalImage,
    String? error,
  }) = _FinalConfirmState;
}
