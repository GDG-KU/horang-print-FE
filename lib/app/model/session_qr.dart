import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_qr.freezed.dart';
part 'session_qr.g.dart';

@freezed
class SessionQr with _$SessionQr {
  factory SessionQr({
    required String slug,
    required String redirect_url,
    required String status,
  }) = _SessionQr;

  factory SessionQr.fromJson(Map<String, dynamic> json) =>
      _$SessionQrFromJson(json);
}
