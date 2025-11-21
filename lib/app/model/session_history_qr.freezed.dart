// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_history_qr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionHistoryQr _$SessionHistoryQrFromJson(Map<String, dynamic> json) {
  return _SessionHistoryQr.fromJson(json);
}

/// @nodoc
mixin _$SessionHistoryQr {
  String get slug => throw _privateConstructorUsedError;
  String get target_url => throw _privateConstructorUsedError;

  /// Serializes this SessionHistoryQr to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionHistoryQr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionHistoryQrCopyWith<SessionHistoryQr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionHistoryQrCopyWith<$Res> {
  factory $SessionHistoryQrCopyWith(
          SessionHistoryQr value, $Res Function(SessionHistoryQr) then) =
      _$SessionHistoryQrCopyWithImpl<$Res, SessionHistoryQr>;
  @useResult
  $Res call({String slug, String target_url});
}

/// @nodoc
class _$SessionHistoryQrCopyWithImpl<$Res, $Val extends SessionHistoryQr>
    implements $SessionHistoryQrCopyWith<$Res> {
  _$SessionHistoryQrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionHistoryQr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? target_url = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      target_url: null == target_url
          ? _value.target_url
          : target_url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionHistoryQrImplCopyWith<$Res>
    implements $SessionHistoryQrCopyWith<$Res> {
  factory _$$SessionHistoryQrImplCopyWith(_$SessionHistoryQrImpl value,
          $Res Function(_$SessionHistoryQrImpl) then) =
      __$$SessionHistoryQrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, String target_url});
}

/// @nodoc
class __$$SessionHistoryQrImplCopyWithImpl<$Res>
    extends _$SessionHistoryQrCopyWithImpl<$Res, _$SessionHistoryQrImpl>
    implements _$$SessionHistoryQrImplCopyWith<$Res> {
  __$$SessionHistoryQrImplCopyWithImpl(_$SessionHistoryQrImpl _value,
      $Res Function(_$SessionHistoryQrImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionHistoryQr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? target_url = null,
  }) {
    return _then(_$SessionHistoryQrImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      target_url: null == target_url
          ? _value.target_url
          : target_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionHistoryQrImpl implements _SessionHistoryQr {
  _$SessionHistoryQrImpl({required this.slug, this.target_url = ""});

  factory _$SessionHistoryQrImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionHistoryQrImplFromJson(json);

  @override
  final String slug;
  @override
  @JsonKey()
  final String target_url;

  @override
  String toString() {
    return 'SessionHistoryQr(slug: $slug, target_url: $target_url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionHistoryQrImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.target_url, target_url) ||
                other.target_url == target_url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, target_url);

  /// Create a copy of SessionHistoryQr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionHistoryQrImplCopyWith<_$SessionHistoryQrImpl> get copyWith =>
      __$$SessionHistoryQrImplCopyWithImpl<_$SessionHistoryQrImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionHistoryQrImplToJson(
      this,
    );
  }
}

abstract class _SessionHistoryQr implements SessionHistoryQr {
  factory _SessionHistoryQr(
      {required final String slug,
      final String target_url}) = _$SessionHistoryQrImpl;

  factory _SessionHistoryQr.fromJson(Map<String, dynamic> json) =
      _$SessionHistoryQrImpl.fromJson;

  @override
  String get slug;
  @override
  String get target_url;

  /// Create a copy of SessionHistoryQr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionHistoryQrImplCopyWith<_$SessionHistoryQrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
