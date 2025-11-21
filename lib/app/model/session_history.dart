import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horang_print/app/model/session_history_qr.dart';

part 'session_history.freezed.dart';
part 'session_history.g.dart';

@freezed
class SessionHistory with _$SessionHistory {
  factory SessionHistory({
    required String uuid,
    required String style,
    required String status,
    required DateTime created_at,
    required DateTime updated_at,
    required SessionHistoryQr qr,
  }) = _SessionHistory;

  factory SessionHistory.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryFromJson(json);
}
