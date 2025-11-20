// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sse_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SseEvent _$SseEventFromJson(Map<String, dynamic> json) {
  return _SseEvent.fromJson(json);
}

/// @nodoc
mixin _$SseEvent {
  String? get id => throw _privateConstructorUsedError;
  String? get event => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  int? get retry => throw _privateConstructorUsedError;

  /// Serializes this SseEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SseEventCopyWith<SseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SseEventCopyWith<$Res> {
  factory $SseEventCopyWith(SseEvent value, $Res Function(SseEvent) then) =
      _$SseEventCopyWithImpl<$Res, SseEvent>;
  @useResult
  $Res call({String? id, String? event, String data, int? retry});
}

/// @nodoc
class _$SseEventCopyWithImpl<$Res, $Val extends SseEvent>
    implements $SseEventCopyWith<$Res> {
  _$SseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? data = null,
    Object? retry = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      retry: freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SseEventImplCopyWith<$Res>
    implements $SseEventCopyWith<$Res> {
  factory _$$SseEventImplCopyWith(
          _$SseEventImpl value, $Res Function(_$SseEventImpl) then) =
      __$$SseEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? event, String data, int? retry});
}

/// @nodoc
class __$$SseEventImplCopyWithImpl<$Res>
    extends _$SseEventCopyWithImpl<$Res, _$SseEventImpl>
    implements _$$SseEventImplCopyWith<$Res> {
  __$$SseEventImplCopyWithImpl(
      _$SseEventImpl _value, $Res Function(_$SseEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? data = null,
    Object? retry = freezed,
  }) {
    return _then(_$SseEventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      retry: freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SseEventImpl implements _SseEvent {
  _$SseEventImpl({this.id, this.event, required this.data, this.retry});

  factory _$SseEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$SseEventImplFromJson(json);

  @override
  final String? id;
  @override
  final String? event;
  @override
  final String data;
  @override
  final int? retry;

  @override
  String toString() {
    return 'SseEvent(id: $id, event: $event, data: $data, retry: $retry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SseEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, event, data, retry);

  /// Create a copy of SseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SseEventImplCopyWith<_$SseEventImpl> get copyWith =>
      __$$SseEventImplCopyWithImpl<_$SseEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SseEventImplToJson(
      this,
    );
  }
}

abstract class _SseEvent implements SseEvent {
  factory _SseEvent(
      {final String? id,
      final String? event,
      required final String data,
      final int? retry}) = _$SseEventImpl;

  factory _SseEvent.fromJson(Map<String, dynamic> json) =
      _$SseEventImpl.fromJson;

  @override
  String? get id;
  @override
  String? get event;
  @override
  String get data;
  @override
  int? get retry;

  /// Create a copy of SseEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SseEventImplCopyWith<_$SseEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
