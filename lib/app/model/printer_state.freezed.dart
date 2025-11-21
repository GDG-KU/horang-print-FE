// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrinterState _$PrinterStateFromJson(Map<String, dynamic> json) {
  return _PrinterState.fromJson(json);
}

/// @nodoc
mixin _$PrinterState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  /// Serializes this PrinterState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterStateCopyWith<PrinterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterStateCopyWith<$Res> {
  factory $PrinterStateCopyWith(
          PrinterState value, $Res Function(PrinterState) then) =
      _$PrinterStateCopyWithImpl<$Res, PrinterState>;
  @useResult
  $Res call({bool isInitialized, bool isConnected});
}

/// @nodoc
class _$PrinterStateCopyWithImpl<$Res, $Val extends PrinterState>
    implements $PrinterStateCopyWith<$Res> {
  _$PrinterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrinterStateImplCopyWith<$Res>
    implements $PrinterStateCopyWith<$Res> {
  factory _$$PrinterStateImplCopyWith(
          _$PrinterStateImpl value, $Res Function(_$PrinterStateImpl) then) =
      __$$PrinterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitialized, bool isConnected});
}

/// @nodoc
class __$$PrinterStateImplCopyWithImpl<$Res>
    extends _$PrinterStateCopyWithImpl<$Res, _$PrinterStateImpl>
    implements _$$PrinterStateImplCopyWith<$Res> {
  __$$PrinterStateImplCopyWithImpl(
      _$PrinterStateImpl _value, $Res Function(_$PrinterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isConnected = null,
  }) {
    return _then(_$PrinterStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrinterStateImpl implements _PrinterState {
  _$PrinterStateImpl({this.isInitialized = false, this.isConnected = false});

  factory _$PrinterStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'PrinterState(isInitialized: $isInitialized, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isConnected);

  /// Create a copy of PrinterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterStateImplCopyWith<_$PrinterStateImpl> get copyWith =>
      __$$PrinterStateImplCopyWithImpl<_$PrinterStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterStateImplToJson(
      this,
    );
  }
}

abstract class _PrinterState implements PrinterState {
  factory _PrinterState({final bool isInitialized, final bool isConnected}) =
      _$PrinterStateImpl;

  factory _PrinterState.fromJson(Map<String, dynamic> json) =
      _$PrinterStateImpl.fromJson;

  @override
  bool get isInitialized;
  @override
  bool get isConnected;

  /// Create a copy of PrinterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterStateImplCopyWith<_$PrinterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
