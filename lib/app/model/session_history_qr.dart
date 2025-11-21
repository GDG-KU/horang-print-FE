import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_history_qr.freezed.dart';
part 'session_history_qr.g.dart';

@freezed
class SessionHistoryQr with _$SessionHistoryQr {
  factory SessionHistoryQr({
    required String slug,
    @Default("") String target_url,
  }) = _SessionHistoryQr;

  factory SessionHistoryQr.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryQrFromJson(json);
}
