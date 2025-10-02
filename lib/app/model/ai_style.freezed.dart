// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiStyle _$AiStyleFromJson(Map<String, dynamic> json) {
  return _AiStyle.fromJson(json);
}

/// @nodoc
mixin _$AiStyle {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get exampleImageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this AiStyle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiStyleCopyWith<AiStyle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiStyleCopyWith<$Res> {
  factory $AiStyleCopyWith(AiStyle value, $Res Function(AiStyle) then) =
      _$AiStyleCopyWithImpl<$Res, AiStyle>;
  @useResult
  $Res call(
      {String id, String name, String exampleImageUrl, String? description});
}

/// @nodoc
class _$AiStyleCopyWithImpl<$Res, $Val extends AiStyle>
    implements $AiStyleCopyWith<$Res> {
  _$AiStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? exampleImageUrl = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exampleImageUrl: null == exampleImageUrl
          ? _value.exampleImageUrl
          : exampleImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiStyleImplCopyWith<$Res> implements $AiStyleCopyWith<$Res> {
  factory _$$AiStyleImplCopyWith(
          _$AiStyleImpl value, $Res Function(_$AiStyleImpl) then) =
      __$$AiStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String exampleImageUrl, String? description});
}

/// @nodoc
class __$$AiStyleImplCopyWithImpl<$Res>
    extends _$AiStyleCopyWithImpl<$Res, _$AiStyleImpl>
    implements _$$AiStyleImplCopyWith<$Res> {
  __$$AiStyleImplCopyWithImpl(
      _$AiStyleImpl _value, $Res Function(_$AiStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? exampleImageUrl = null,
    Object? description = freezed,
  }) {
    return _then(_$AiStyleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exampleImageUrl: null == exampleImageUrl
          ? _value.exampleImageUrl
          : exampleImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiStyleImpl implements _AiStyle {
  const _$AiStyleImpl(
      {required this.id,
      required this.name,
      required this.exampleImageUrl,
      this.description});

  factory _$AiStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiStyleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String exampleImageUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'AiStyle(id: $id, name: $name, exampleImageUrl: $exampleImageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiStyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.exampleImageUrl, exampleImageUrl) ||
                other.exampleImageUrl == exampleImageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, exampleImageUrl, description);

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiStyleImplCopyWith<_$AiStyleImpl> get copyWith =>
      __$$AiStyleImplCopyWithImpl<_$AiStyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiStyleImplToJson(
      this,
    );
  }
}

abstract class _AiStyle implements AiStyle {
  const factory _AiStyle(
      {required final String id,
      required final String name,
      required final String exampleImageUrl,
      final String? description}) = _$AiStyleImpl;

  factory _AiStyle.fromJson(Map<String, dynamic> json) = _$AiStyleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get exampleImageUrl;
  @override
  String? get description;

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiStyleImplCopyWith<_$AiStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
