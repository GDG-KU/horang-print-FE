// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sse_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SseEventImpl _$$SseEventImplFromJson(Map<String, dynamic> json) =>
    _$SseEventImpl(
      id: json['id'] as String?,
      event: json['event'] as String?,
      data: json['data'] as String,
      retry: (json['retry'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SseEventImplToJson(_$SseEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'data': instance.data,
      'retry': instance.retry,
    };
