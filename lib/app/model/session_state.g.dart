// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionStateImpl _$$SessionStateImplFromJson(Map<String, dynamic> json) =>
    _$SessionStateImpl(
      session_uuid: json['session_uuid'] as String? ?? "",
      qr: json['qr'] == null
          ? null
          : SessionQr.fromJson(json['qr'] as Map<String, dynamic>),
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionStateImplToJson(_$SessionStateImpl instance) =>
    <String, dynamic>{
      'session_uuid': instance.session_uuid,
      'qr': instance.qr,
      'isDone': instance.isDone,
    };
