// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartState {
  List<String> get backgroundImages => throw _privateConstructorUsedError;
  int get currentImageIndex => throw _privateConstructorUsedError;

  /// Create a copy of StartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartStateCopyWith<StartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStateCopyWith<$Res> {
  factory $StartStateCopyWith(
          StartState value, $Res Function(StartState) then) =
      _$StartStateCopyWithImpl<$Res, StartState>;
  @useResult
  $Res call({List<String> backgroundImages, int currentImageIndex});
}

/// @nodoc
class _$StartStateCopyWithImpl<$Res, $Val extends StartState>
    implements $StartStateCopyWith<$Res> {
  _$StartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundImages = null,
    Object? currentImageIndex = null,
  }) {
    return _then(_value.copyWith(
      backgroundImages: null == backgroundImages
          ? _value.backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartStateImplCopyWith<$Res>
    implements $StartStateCopyWith<$Res> {
  factory _$$StartStateImplCopyWith(
          _$StartStateImpl value, $Res Function(_$StartStateImpl) then) =
      __$$StartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> backgroundImages, int currentImageIndex});
}

/// @nodoc
class __$$StartStateImplCopyWithImpl<$Res>
    extends _$StartStateCopyWithImpl<$Res, _$StartStateImpl>
    implements _$$StartStateImplCopyWith<$Res> {
  __$$StartStateImplCopyWithImpl(
      _$StartStateImpl _value, $Res Function(_$StartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundImages = null,
    Object? currentImageIndex = null,
  }) {
    return _then(_$StartStateImpl(
      backgroundImages: null == backgroundImages
          ? _value._backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StartStateImpl implements _StartState {
  const _$StartStateImpl(
      {final List<String> backgroundImages = const [
        'assets/images/sample1.jpg',
        'assets/images/sample2.jpg',
        'assets/images/sample3.jpg'
      ],
      this.currentImageIndex = 0})
      : _backgroundImages = backgroundImages;

  final List<String> _backgroundImages;
  @override
  @JsonKey()
  List<String> get backgroundImages {
    if (_backgroundImages is EqualUnmodifiableListView)
      return _backgroundImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backgroundImages);
  }

  @override
  @JsonKey()
  final int currentImageIndex;

  @override
  String toString() {
    return 'StartState(backgroundImages: $backgroundImages, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._backgroundImages, _backgroundImages) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_backgroundImages),
      currentImageIndex);

  /// Create a copy of StartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartStateImplCopyWith<_$StartStateImpl> get copyWith =>
      __$$StartStateImplCopyWithImpl<_$StartStateImpl>(this, _$identity);
}

abstract class _StartState implements StartState {
  const factory _StartState(
      {final List<String> backgroundImages,
      final int currentImageIndex}) = _$StartStateImpl;

  @override
  List<String> get backgroundImages;
  @override
  int get currentImageIndex;

  /// Create a copy of StartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartStateImplCopyWith<_$StartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
