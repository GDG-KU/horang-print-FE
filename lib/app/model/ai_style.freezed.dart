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
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get thumbnail_url => throw _privateConstructorUsedError;

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
      {int id,
      String code,
      String name,
      String description,
      bool is_active,
      String thumbnail_url});
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
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? is_active = null,
    Object? thumbnail_url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail_url: null == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int id,
      String code,
      String name,
      String description,
      bool is_active,
      String thumbnail_url});
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
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? is_active = null,
    Object? thumbnail_url = null,
  }) {
    return _then(_$AiStyleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail_url: null == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiStyleImpl implements _AiStyle {
  const _$AiStyleImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.description,
      this.is_active = false,
      this.thumbnail_url = ""});

  factory _$AiStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiStyleImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey()
  final bool is_active;
  @override
  @JsonKey()
  final String thumbnail_url;

  @override
  String toString() {
    return 'AiStyle(id: $id, code: $code, name: $name, description: $description, is_active: $is_active, thumbnail_url: $thumbnail_url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiStyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            (identical(other.thumbnail_url, thumbnail_url) ||
                other.thumbnail_url == thumbnail_url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, name, description, is_active, thumbnail_url);

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
      {required final int id,
      required final String code,
      required final String name,
      required final String description,
      final bool is_active,
      final String thumbnail_url}) = _$AiStyleImpl;

  factory _AiStyle.fromJson(Map<String, dynamic> json) = _$AiStyleImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get description;
  @override
  bool get is_active;
  @override
  String get thumbnail_url;

  /// Create a copy of AiStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiStyleImplCopyWith<_$AiStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
