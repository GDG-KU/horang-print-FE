// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_qr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionQrImpl _$$SessionQrImplFromJson(Map<String, dynamic> json) =>
    _$SessionQrImpl(
      slug: json['slug'] as String,
      redirect_url: json['redirect_url'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$SessionQrImplToJson(_$SessionQrImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'redirect_url': instance.redirect_url,
      'status': instance.status,
    };
