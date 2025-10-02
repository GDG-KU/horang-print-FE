import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_state.freezed.dart';

@freezed
class StartState with _$StartState {
  const factory StartState({
    @Default([
      'assets/images/sample1.jpg',
      'assets/images/sample2.jpg',
      'assets/images/sample3.jpg',
    ]) List<String> backgroundImages,
    @Default(0) int currentImageIndex,
  }) = _StartState;
}