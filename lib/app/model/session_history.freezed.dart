// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionHistory _$SessionHistoryFromJson(Map<String, dynamic> json) {
  return _SessionHistory.fromJson(json);
}

/// @nodoc
mixin _$SessionHistory {
  String get uuid => throw _privateConstructorUsedError;
  String get style => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  DateTime get updated_at => throw _privateConstructorUsedError;
  SessionHistoryQr get qr => throw _privateConstructorUsedError;

  /// Serializes this SessionHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionHistoryCopyWith<SessionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionHistoryCopyWith<$Res> {
  factory $SessionHistoryCopyWith(
          SessionHistory value, $Res Function(SessionHistory) then) =
      _$SessionHistoryCopyWithImpl<$Res, SessionHistory>;
  @useResult
  $Res call(
      {String uuid,
      String style,
      String status,
      DateTime created_at,
      DateTime updated_at,
      SessionHistoryQr qr});

  $SessionHistoryQrCopyWith<$Res> get qr;
}

/// @nodoc
class _$SessionHistoryCopyWithImpl<$Res, $Val extends SessionHistory>
    implements $SessionHistoryCopyWith<$Res> {
  _$SessionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? style = null,
    Object? status = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? qr = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as SessionHistoryQr,
    ) as $Val);
  }

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryQrCopyWith<$Res> get qr {
    return $SessionHistoryQrCopyWith<$Res>(_value.qr, (value) {
      return _then(_value.copyWith(qr: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionHistoryImplCopyWith<$Res>
    implements $SessionHistoryCopyWith<$Res> {
  factory _$$SessionHistoryImplCopyWith(_$SessionHistoryImpl value,
          $Res Function(_$SessionHistoryImpl) then) =
      __$$SessionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String style,
      String status,
      DateTime created_at,
      DateTime updated_at,
      SessionHistoryQr qr});

  @override
  $SessionHistoryQrCopyWith<$Res> get qr;
}

/// @nodoc
class __$$SessionHistoryImplCopyWithImpl<$Res>
    extends _$SessionHistoryCopyWithImpl<$Res, _$SessionHistoryImpl>
    implements _$$SessionHistoryImplCopyWith<$Res> {
  __$$SessionHistoryImplCopyWithImpl(
      _$SessionHistoryImpl _value, $Res Function(_$SessionHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? style = null,
    Object? status = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? qr = null,
  }) {
    return _then(_$SessionHistoryImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as SessionHistoryQr,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionHistoryImpl implements _SessionHistory {
  _$SessionHistoryImpl(
      {required this.uuid,
      required this.style,
      required this.status,
      required this.created_at,
      required this.updated_at,
      required this.qr});

  factory _$SessionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionHistoryImplFromJson(json);

  @override
  final String uuid;
  @override
  final String style;
  @override
  final String status;
  @override
  final DateTime created_at;
  @override
  final DateTime updated_at;
  @override
  final SessionHistoryQr qr;

  @override
  String toString() {
    return 'SessionHistory(uuid: $uuid, style: $style, status: $status, created_at: $created_at, updated_at: $updated_at, qr: $qr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionHistoryImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.qr, qr) || other.qr == qr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, style, status, created_at, updated_at, qr);

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionHistoryImplCopyWith<_$SessionHistoryImpl> get copyWith =>
      __$$SessionHistoryImplCopyWithImpl<_$SessionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionHistoryImplToJson(
      this,
    );
  }
}

abstract class _SessionHistory implements SessionHistory {
  factory _SessionHistory(
      {required final String uuid,
      required final String style,
      required final String status,
      required final DateTime created_at,
      required final DateTime updated_at,
      required final SessionHistoryQr qr}) = _$SessionHistoryImpl;

  factory _SessionHistory.fromJson(Map<String, dynamic> json) =
      _$SessionHistoryImpl.fromJson;

  @override
  String get uuid;
  @override
  String get style;
  @override
  String get status;
  @override
  DateTime get created_at;
  @override
  DateTime get updated_at;
  @override
  SessionHistoryQr get qr;

  /// Create a copy of SessionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionHistoryImplCopyWith<_$SessionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
