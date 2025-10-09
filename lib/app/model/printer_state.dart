import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_state.freezed.dart';
part 'printer_state.g.dart';

@freezed
class PrinterState with _$PrinterState {
  factory PrinterState({
    @Default(false) bool isConnected,
  }) = _PrinterState;

  factory PrinterState.fromJson(Map<String, dynamic> json) =>
      _$PrinterStateFromJson(json);
}
