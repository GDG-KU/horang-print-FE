import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horang_print/app/model/session_history.dart';

part 'management_state.freezed.dart';
part 'management_state.g.dart';

@freezed
class ManagementState with _$ManagementState {
  factory ManagementState({
    required List<SessionHistory> sessionHistories,
    @Default(false) bool isPrinting,
  }) = _ManagementState;

  factory ManagementState.fromJson(Map<String, dynamic> json) =>
      _$ManagementStateFromJson(json);
}
