// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_output_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrintOutputState {
  int get printQuantity => throw _privateConstructorUsedError;
  int get minQuantity => throw _privateConstructorUsedError;
  int get maxQuantity => throw _privateConstructorUsedError;
  bool get isPrinting => throw _privateConstructorUsedError;

  /// Create a copy of PrintOutputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintOutputStateCopyWith<PrintOutputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintOutputStateCopyWith<$Res> {
  factory $PrintOutputStateCopyWith(
          PrintOutputState value, $Res Function(PrintOutputState) then) =
      _$PrintOutputStateCopyWithImpl<$Res, PrintOutputState>;
  @useResult
  $Res call(
      {int printQuantity, int minQuantity, int maxQuantity, bool isPrinting});
}

/// @nodoc
class _$PrintOutputStateCopyWithImpl<$Res, $Val extends PrintOutputState>
    implements $PrintOutputStateCopyWith<$Res> {
  _$PrintOutputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintOutputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printQuantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? isPrinting = null,
  }) {
    return _then(_value.copyWith(
      printQuantity: null == printQuantity
          ? _value.printQuantity
          : printQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPrinting: null == isPrinting
          ? _value.isPrinting
          : isPrinting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrintOutputStateImplCopyWith<$Res>
    implements $PrintOutputStateCopyWith<$Res> {
  factory _$$PrintOutputStateImplCopyWith(_$PrintOutputStateImpl value,
          $Res Function(_$PrintOutputStateImpl) then) =
      __$$PrintOutputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int printQuantity, int minQuantity, int maxQuantity, bool isPrinting});
}

/// @nodoc
class __$$PrintOutputStateImplCopyWithImpl<$Res>
    extends _$PrintOutputStateCopyWithImpl<$Res, _$PrintOutputStateImpl>
    implements _$$PrintOutputStateImplCopyWith<$Res> {
  __$$PrintOutputStateImplCopyWithImpl(_$PrintOutputStateImpl _value,
      $Res Function(_$PrintOutputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintOutputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printQuantity = null,
    Object? minQuantity = null,
    Object? maxQuantity = null,
    Object? isPrinting = null,
  }) {
    return _then(_$PrintOutputStateImpl(
      printQuantity: null == printQuantity
          ? _value.printQuantity
          : printQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPrinting: null == isPrinting
          ? _value.isPrinting
          : isPrinting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrintOutputStateImpl implements _PrintOutputState {
  const _$PrintOutputStateImpl(
      {this.printQuantity = 1,
      this.minQuantity = 1,
      this.maxQuantity = 8,
      this.isPrinting = false});

  @override
  @JsonKey()
  final int printQuantity;
  @override
  @JsonKey()
  final int minQuantity;
  @override
  @JsonKey()
  final int maxQuantity;
  @override
  @JsonKey()
  final bool isPrinting;

  @override
  String toString() {
    return 'PrintOutputState(printQuantity: $printQuantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, isPrinting: $isPrinting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintOutputStateImpl &&
            (identical(other.printQuantity, printQuantity) ||
                other.printQuantity == printQuantity) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.isPrinting, isPrinting) ||
                other.isPrinting == isPrinting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, printQuantity, minQuantity, maxQuantity, isPrinting);

  /// Create a copy of PrintOutputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintOutputStateImplCopyWith<_$PrintOutputStateImpl> get copyWith =>
      __$$PrintOutputStateImplCopyWithImpl<_$PrintOutputStateImpl>(
          this, _$identity);
}

abstract class _PrintOutputState implements PrintOutputState {
  const factory _PrintOutputState(
      {final int printQuantity,
      final int minQuantity,
      final int maxQuantity,
      final bool isPrinting}) = _$PrintOutputStateImpl;

  @override
  int get printQuantity;
  @override
  int get minQuantity;
  @override
  int get maxQuantity;
  @override
  bool get isPrinting;

  /// Create a copy of PrintOutputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintOutputStateImplCopyWith<_$PrintOutputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
