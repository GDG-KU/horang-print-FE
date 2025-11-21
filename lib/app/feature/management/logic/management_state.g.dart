// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagementStateImpl _$$ManagementStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ManagementStateImpl(
      sessionHistories: (json['sessionHistories'] as List<dynamic>)
          .map((e) => SessionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPrinting: json['isPrinting'] as bool? ?? false,
    );

Map<String, dynamic> _$$ManagementStateImplToJson(
        _$ManagementStateImpl instance) =>
    <String, dynamic>{
      'sessionHistories': instance.sessionHistories,
      'isPrinting': instance.isPrinting,
    };
