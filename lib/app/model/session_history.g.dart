// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionHistoryImpl _$$SessionHistoryImplFromJson(Map<String, dynamic> json) =>
    _$SessionHistoryImpl(
      uuid: json['uuid'] as String,
      style: json['style'] as String,
      status: json['status'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      qr: SessionHistoryQr.fromJson(json['qr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionHistoryImplToJson(
        _$SessionHistoryImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'style': instance.style,
      'status': instance.status,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'qr': instance.qr,
    };
