// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiStyleImpl _$$AiStyleImplFromJson(Map<String, dynamic> json) =>
    _$AiStyleImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      is_active: json['is_active'] as bool? ?? false,
      thumbnail_url: json['thumbnail_url'] as String? ?? "",
    );

Map<String, dynamic> _$$AiStyleImplToJson(_$AiStyleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'is_active': instance.is_active,
      'thumbnail_url': instance.thumbnail_url,
    };
