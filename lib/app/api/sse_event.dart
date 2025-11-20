import 'package:freezed_annotation/freezed_annotation.dart';

part 'sse_event.freezed.dart';
part 'sse_event.g.dart';

@freezed
class SseEvent with _$SseEvent {
  factory SseEvent({
    String? id,
    String? event,
    required String data,
    int? retry,
  }) = _SseEvent;

  factory SseEvent.fromJson(Map<String, dynamic> json) =>
      _$SseEventFromJson(json);
}
