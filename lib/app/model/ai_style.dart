import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_style.freezed.dart';
part 'ai_style.g.dart';

@freezed
class AiStyle with _$AiStyle {
  const factory AiStyle({
    required int id,
    required String code,
    required String name,
    required String description,
    @Default(false) bool is_active,
    @Default("") String thumbnail_url,
  }) = _AiStyle;

  factory AiStyle.fromJson(Map<String, dynamic> json) =>
      _$AiStyleFromJson(json);
}
