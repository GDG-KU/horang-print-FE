// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionState _$SessionStateFromJson(Map<String, dynamic> json) {
  return _SessionState.fromJson(json);
}

/// @nodoc
mixin _$SessionState {
  String get session_uuid => throw _privateConstructorUsedError;
  SessionQr? get qr => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  /// Serializes this SessionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call(
      {String session_uuid,
      SessionQr? qr,
      bool isDone,
      bool isError,
      double progress});

  $SessionQrCopyWith<$Res>? get qr;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_uuid = null,
    Object? qr = freezed,
    Object? isDone = null,
    Object? isError = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      session_uuid: null == session_uuid
          ? _value.session_uuid
          : session_uuid // ignore: cast_nullable_to_non_nullable
              as String,
      qr: freezed == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as SessionQr?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionQrCopyWith<$Res>? get qr {
    if (_value.qr == null) {
      return null;
    }

    return $SessionQrCopyWith<$Res>(_value.qr!, (value) {
      return _then(_value.copyWith(qr: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionStateImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateImplCopyWith(
          _$SessionStateImpl value, $Res Function(_$SessionStateImpl) then) =
      __$$SessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String session_uuid,
      SessionQr? qr,
      bool isDone,
      bool isError,
      double progress});

  @override
  $SessionQrCopyWith<$Res>? get qr;
}

/// @nodoc
class __$$SessionStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateImpl>
    implements _$$SessionStateImplCopyWith<$Res> {
  __$$SessionStateImplCopyWithImpl(
      _$SessionStateImpl _value, $Res Function(_$SessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_uuid = null,
    Object? qr = freezed,
    Object? isDone = null,
    Object? isError = null,
    Object? progress = null,
  }) {
    return _then(_$SessionStateImpl(
      session_uuid: null == session_uuid
          ? _value.session_uuid
          : session_uuid // ignore: cast_nullable_to_non_nullable
              as String,
      qr: freezed == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as SessionQr?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionStateImpl implements _SessionState {
  _$SessionStateImpl(
      {this.session_uuid = "",
      this.qr,
      this.isDone = false,
      this.isError = false,
      this.progress = 0.0});

  factory _$SessionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionStateImplFromJson(json);

  @override
  @JsonKey()
  final String session_uuid;
  @override
  final SessionQr? qr;
  @override
  @JsonKey()
  final bool isDone;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'SessionState(session_uuid: $session_uuid, qr: $qr, isDone: $isDone, isError: $isError, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateImpl &&
            (identical(other.session_uuid, session_uuid) ||
                other.session_uuid == session_uuid) &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, session_uuid, qr, isDone, isError, progress);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      __$$SessionStateImplCopyWithImpl<_$SessionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionStateImplToJson(
      this,
    );
  }
}

abstract class _SessionState implements SessionState {
  factory _SessionState(
      {final String session_uuid,
      final SessionQr? qr,
      final bool isDone,
      final bool isError,
      final double progress}) = _$SessionStateImpl;

  factory _SessionState.fromJson(Map<String, dynamic> json) =
      _$SessionStateImpl.fromJson;

  @override
  String get session_uuid;
  @override
  SessionQr? get qr;
  @override
  bool get isDone;
  @override
  bool get isError;
  @override
  double get progress;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
