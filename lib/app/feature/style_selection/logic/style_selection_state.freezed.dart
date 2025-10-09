// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'style_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StyleSelectionState {
  List<AiStyle> get styles => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  int? get selectedStyleId => throw _privateConstructorUsedError;

  /// Create a copy of StyleSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StyleSelectionStateCopyWith<StyleSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleSelectionStateCopyWith<$Res> {
  factory $StyleSelectionStateCopyWith(
          StyleSelectionState value, $Res Function(StyleSelectionState) then) =
      _$StyleSelectionStateCopyWithImpl<$Res, StyleSelectionState>;
  @useResult
  $Res call(
      {List<AiStyle> styles,
      bool isLoading,
      bool isError,
      int? selectedStyleId});
}

/// @nodoc
class _$StyleSelectionStateCopyWithImpl<$Res, $Val extends StyleSelectionState>
    implements $StyleSelectionStateCopyWith<$Res> {
  _$StyleSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StyleSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styles = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? selectedStyleId = freezed,
  }) {
    return _then(_value.copyWith(
      styles: null == styles
          ? _value.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AiStyle>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStyleId: freezed == selectedStyleId
          ? _value.selectedStyleId
          : selectedStyleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyleSelectionStateImplCopyWith<$Res>
    implements $StyleSelectionStateCopyWith<$Res> {
  factory _$$StyleSelectionStateImplCopyWith(_$StyleSelectionStateImpl value,
          $Res Function(_$StyleSelectionStateImpl) then) =
      __$$StyleSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AiStyle> styles,
      bool isLoading,
      bool isError,
      int? selectedStyleId});
}

/// @nodoc
class __$$StyleSelectionStateImplCopyWithImpl<$Res>
    extends _$StyleSelectionStateCopyWithImpl<$Res, _$StyleSelectionStateImpl>
    implements _$$StyleSelectionStateImplCopyWith<$Res> {
  __$$StyleSelectionStateImplCopyWithImpl(_$StyleSelectionStateImpl _value,
      $Res Function(_$StyleSelectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StyleSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styles = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? selectedStyleId = freezed,
  }) {
    return _then(_$StyleSelectionStateImpl(
      styles: null == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AiStyle>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStyleId: freezed == selectedStyleId
          ? _value.selectedStyleId
          : selectedStyleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$StyleSelectionStateImpl implements _StyleSelectionState {
  const _$StyleSelectionStateImpl(
      {final List<AiStyle> styles = const [],
      this.isLoading = false,
      this.isError = false,
      this.selectedStyleId})
      : _styles = styles;

  final List<AiStyle> _styles;
  @override
  @JsonKey()
  List<AiStyle> get styles {
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_styles);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  final int? selectedStyleId;

  @override
  String toString() {
    return 'StyleSelectionState(styles: $styles, isLoading: $isLoading, isError: $isError, selectedStyleId: $selectedStyleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyleSelectionStateImpl &&
            const DeepCollectionEquality().equals(other._styles, _styles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.selectedStyleId, selectedStyleId) ||
                other.selectedStyleId == selectedStyleId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_styles),
      isLoading,
      isError,
      selectedStyleId);

  /// Create a copy of StyleSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StyleSelectionStateImplCopyWith<_$StyleSelectionStateImpl> get copyWith =>
      __$$StyleSelectionStateImplCopyWithImpl<_$StyleSelectionStateImpl>(
          this, _$identity);
}

abstract class _StyleSelectionState implements StyleSelectionState {
  const factory _StyleSelectionState(
      {final List<AiStyle> styles,
      final bool isLoading,
      final bool isError,
      final int? selectedStyleId}) = _$StyleSelectionStateImpl;

  @override
  List<AiStyle> get styles;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  int? get selectedStyleId;

  /// Create a copy of StyleSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StyleSelectionStateImplCopyWith<_$StyleSelectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
