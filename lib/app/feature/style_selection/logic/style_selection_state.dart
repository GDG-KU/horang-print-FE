import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horang_print/app/model/ai_style.dart';

part 'style_selection_state.freezed.dart';

@freezed
class StyleSelectionState with _$StyleSelectionState {
  const factory StyleSelectionState({
    @Default([]) List<AiStyle> styles,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    int? selectedStyleId,
  }) = _StyleSelectionState;
}
