import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'photo_taking_state.freezed.dart';

@freezed
class PhotoTakingState with _$PhotoTakingState {
  const factory PhotoTakingState({
    @Default(false) bool isCountingDown,
    @Default(3) int countdown,
    @Default(false) bool isCameraReady,
    @Default(false) bool isCapturing,
    @Default(false) bool isInitializing,
    CameraController? cameraController,
    String? errorMessage,
    Uint8List? capturedImage,
  }) = _PhotoTakingState;
}