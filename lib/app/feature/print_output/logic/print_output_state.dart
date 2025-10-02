import 'package:freezed_annotation/freezed_annotation.dart';

part 'print_output_state.freezed.dart';

@freezed
class PrintOutputState with _$PrintOutputState {
  const factory PrintOutputState({
    @Default(1) int printQuantity,
    @Default(1) int minQuantity,
    @Default(8) int maxQuantity,
    @Default(false) bool isPrinting,
  }) = _PrintOutputState;
}