import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horang_print/app/model/session_qr.dart';

part 'session_state.freezed.dart';
part 'session_state.g.dart';

@freezed
class SessionState with _$SessionState {
  factory SessionState({
    @Default("") String session_uuid,
    SessionQr? qr,
    @Default(false) bool isDone,
  }) = _SessionState;

  factory SessionState.fromJson(Map<String, dynamic> json) =>
      _$SessionStateFromJson(json);
}
