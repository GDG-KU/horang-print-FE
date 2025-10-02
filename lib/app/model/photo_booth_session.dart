import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'photo_booth_session.freezed.dart';

@freezed
class PhotoBoothSession with _$PhotoBoothSession {
  const factory PhotoBoothSession({
    String? selectedStyleId,
    Uint8List? capturedPhoto,
    Uint8List? aiTransformedPhoto,
    String? downloadUrl,
    String? qrCodeUrl,
    @Default(1) int printQuantity,
    @Default(PhotoBoothStatus.idle) PhotoBoothStatus status,
    String? error,
  }) = _PhotoBoothSession;
}

enum PhotoBoothStatus {
  idle,
  capturing,
  processing,
  ready,
  printing,
  completed,
  error
}