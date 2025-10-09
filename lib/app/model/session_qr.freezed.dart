// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_qr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionQr _$SessionQrFromJson(Map<String, dynamic> json) {
  return _SessionQr.fromJson(json);
}

/// @nodoc
mixin _$SessionQr {
  String get slug => throw _privateConstructorUsedError;
  String get redirect_url => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this SessionQr to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionQr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionQrCopyWith<SessionQr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionQrCopyWith<$Res> {
  factory $SessionQrCopyWith(SessionQr value, $Res Function(SessionQr) then) =
      _$SessionQrCopyWithImpl<$Res, SessionQr>;
  @useResult
  $Res call({String slug, String redirect_url, String status});
}

/// @nodoc
class _$SessionQrCopyWithImpl<$Res, $Val extends SessionQr>
    implements $SessionQrCopyWith<$Res> {
  _$SessionQrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionQr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? redirect_url = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      redirect_url: null == redirect_url
          ? _value.redirect_url
          : redirect_url // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionQrImplCopyWith<$Res>
    implements $SessionQrCopyWith<$Res> {
  factory _$$SessionQrImplCopyWith(
          _$SessionQrImpl value, $Res Function(_$SessionQrImpl) then) =
      __$$SessionQrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, String redirect_url, String status});
}

/// @nodoc
class __$$SessionQrImplCopyWithImpl<$Res>
    extends _$SessionQrCopyWithImpl<$Res, _$SessionQrImpl>
    implements _$$SessionQrImplCopyWith<$Res> {
  __$$SessionQrImplCopyWithImpl(
      _$SessionQrImpl _value, $Res Function(_$SessionQrImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionQr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? redirect_url = null,
    Object? status = null,
  }) {
    return _then(_$SessionQrImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      redirect_url: null == redirect_url
          ? _value.redirect_url
          : redirect_url // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionQrImpl implements _SessionQr {
  _$SessionQrImpl(
      {required this.slug, required this.redirect_url, required this.status});

  factory _$SessionQrImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionQrImplFromJson(json);

  @override
  final String slug;
  @override
  final String redirect_url;
  @override
  final String status;

  @override
  String toString() {
    return 'SessionQr(slug: $slug, redirect_url: $redirect_url, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionQrImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.redirect_url, redirect_url) ||
                other.redirect_url == redirect_url) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, redirect_url, status);

  /// Create a copy of SessionQr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionQrImplCopyWith<_$SessionQrImpl> get copyWith =>
      __$$SessionQrImplCopyWithImpl<_$SessionQrImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionQrImplToJson(
      this,
    );
  }
}

abstract class _SessionQr implements SessionQr {
  factory _SessionQr(
      {required final String slug,
      required final String redirect_url,
      required final String status}) = _$SessionQrImpl;

  factory _SessionQr.fromJson(Map<String, dynamic> json) =
      _$SessionQrImpl.fromJson;

  @override
  String get slug;
  @override
  String get redirect_url;
  @override
  String get status;

  /// Create a copy of SessionQr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionQrImplCopyWith<_$SessionQrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
