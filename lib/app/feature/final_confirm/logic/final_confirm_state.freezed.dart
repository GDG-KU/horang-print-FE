// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_confirm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinalConfirmState {
  bool get isProcessing => throw _privateConstructorUsedError;
  Uint8List? get transformedImage => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;
  String? get qrCodeData => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of FinalConfirmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinalConfirmStateCopyWith<FinalConfirmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalConfirmStateCopyWith<$Res> {
  factory $FinalConfirmStateCopyWith(
          FinalConfirmState value, $Res Function(FinalConfirmState) then) =
      _$FinalConfirmStateCopyWithImpl<$Res, FinalConfirmState>;
  @useResult
  $Res call(
      {bool isProcessing,
      Uint8List? transformedImage,
      String? downloadUrl,
      String? qrCodeData,
      String? error});
}

/// @nodoc
class _$FinalConfirmStateCopyWithImpl<$Res, $Val extends FinalConfirmState>
    implements $FinalConfirmStateCopyWith<$Res> {
  _$FinalConfirmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinalConfirmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? transformedImage = freezed,
    Object? downloadUrl = freezed,
    Object? qrCodeData = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      transformedImage: freezed == transformedImage
          ? _value.transformedImage
          : transformedImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinalConfirmStateImplCopyWith<$Res>
    implements $FinalConfirmStateCopyWith<$Res> {
  factory _$$FinalConfirmStateImplCopyWith(_$FinalConfirmStateImpl value,
          $Res Function(_$FinalConfirmStateImpl) then) =
      __$$FinalConfirmStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isProcessing,
      Uint8List? transformedImage,
      String? downloadUrl,
      String? qrCodeData,
      String? error});
}

/// @nodoc
class __$$FinalConfirmStateImplCopyWithImpl<$Res>
    extends _$FinalConfirmStateCopyWithImpl<$Res, _$FinalConfirmStateImpl>
    implements _$$FinalConfirmStateImplCopyWith<$Res> {
  __$$FinalConfirmStateImplCopyWithImpl(_$FinalConfirmStateImpl _value,
      $Res Function(_$FinalConfirmStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinalConfirmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? transformedImage = freezed,
    Object? downloadUrl = freezed,
    Object? qrCodeData = freezed,
    Object? error = freezed,
  }) {
    return _then(_$FinalConfirmStateImpl(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      transformedImage: freezed == transformedImage
          ? _value.transformedImage
          : transformedImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FinalConfirmStateImpl implements _FinalConfirmState {
  const _$FinalConfirmStateImpl(
      {this.isProcessing = true,
      this.transformedImage,
      this.downloadUrl,
      this.qrCodeData,
      this.error});

  @override
  @JsonKey()
  final bool isProcessing;
  @override
  final Uint8List? transformedImage;
  @override
  final String? downloadUrl;
  @override
  final String? qrCodeData;
  @override
  final String? error;

  @override
  String toString() {
    return 'FinalConfirmState(isProcessing: $isProcessing, transformedImage: $transformedImage, downloadUrl: $downloadUrl, qrCodeData: $qrCodeData, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinalConfirmStateImpl &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            const DeepCollectionEquality()
                .equals(other.transformedImage, transformedImage) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isProcessing,
      const DeepCollectionEquality().hash(transformedImage),
      downloadUrl,
      qrCodeData,
      error);

  /// Create a copy of FinalConfirmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinalConfirmStateImplCopyWith<_$FinalConfirmStateImpl> get copyWith =>
      __$$FinalConfirmStateImplCopyWithImpl<_$FinalConfirmStateImpl>(
          this, _$identity);
}

abstract class _FinalConfirmState implements FinalConfirmState {
  const factory _FinalConfirmState(
      {final bool isProcessing,
      final Uint8List? transformedImage,
      final String? downloadUrl,
      final String? qrCodeData,
      final String? error}) = _$FinalConfirmStateImpl;

  @override
  bool get isProcessing;
  @override
  Uint8List? get transformedImage;
  @override
  String? get downloadUrl;
  @override
  String? get qrCodeData;
  @override
  String? get error;

  /// Create a copy of FinalConfirmState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinalConfirmStateImplCopyWith<_$FinalConfirmStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
