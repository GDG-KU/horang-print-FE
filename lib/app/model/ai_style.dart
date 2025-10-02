import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_style.freezed.dart';
part 'ai_style.g.dart';

@freezed
class AiStyle with _$AiStyle {
  const factory AiStyle({
    required String id,
    required String name,
    required String exampleImageUrl,
    String? description,
  }) = _AiStyle;

  factory AiStyle.fromJson(Map<String, dynamic> json) =>
      _$AiStyleFromJson(json);
}