// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiStyleImpl _$$AiStyleImplFromJson(Map<String, dynamic> json) =>
    _$AiStyleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      exampleImageUrl: json['exampleImageUrl'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$AiStyleImplToJson(_$AiStyleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'exampleImageUrl': instance.exampleImageUrl,
      'description': instance.description,
    };
