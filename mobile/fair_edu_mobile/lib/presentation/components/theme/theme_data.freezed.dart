// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppThemeData {
  ThemeMode get mode => throw _privateConstructorUsedError;
  ThemeData get materialThemeData => throw _privateConstructorUsedError;
  AppColorThemeData get colorTheme => throw _privateConstructorUsedError;
  AppTextThemeData get textTheme => throw _privateConstructorUsedError;

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppThemeDataCopyWith<AppThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeDataCopyWith<$Res> {
  factory $AppThemeDataCopyWith(
          AppThemeData value, $Res Function(AppThemeData) then) =
      _$AppThemeDataCopyWithImpl<$Res, AppThemeData>;
  @useResult
  $Res call(
      {ThemeMode mode,
      ThemeData materialThemeData,
      AppColorThemeData colorTheme,
      AppTextThemeData textTheme});

  $AppColorThemeDataCopyWith<$Res> get colorTheme;
  $AppTextThemeDataCopyWith<$Res> get textTheme;
}

/// @nodoc
class _$AppThemeDataCopyWithImpl<$Res, $Val extends AppThemeData>
    implements $AppThemeDataCopyWith<$Res> {
  _$AppThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? materialThemeData = null,
    Object? colorTheme = null,
    Object? textTheme = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      materialThemeData: null == materialThemeData
          ? _value.materialThemeData
          : materialThemeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      colorTheme: null == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as AppColorThemeData,
      textTheme: null == textTheme
          ? _value.textTheme
          : textTheme // ignore: cast_nullable_to_non_nullable
              as AppTextThemeData,
    ) as $Val);
  }

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppColorThemeDataCopyWith<$Res> get colorTheme {
    return $AppColorThemeDataCopyWith<$Res>(_value.colorTheme, (value) {
      return _then(_value.copyWith(colorTheme: value) as $Val);
    });
  }

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppTextThemeDataCopyWith<$Res> get textTheme {
    return $AppTextThemeDataCopyWith<$Res>(_value.textTheme, (value) {
      return _then(_value.copyWith(textTheme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppThemeDataImplCopyWith<$Res>
    implements $AppThemeDataCopyWith<$Res> {
  factory _$$AppThemeDataImplCopyWith(
          _$AppThemeDataImpl value, $Res Function(_$AppThemeDataImpl) then) =
      __$$AppThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeMode mode,
      ThemeData materialThemeData,
      AppColorThemeData colorTheme,
      AppTextThemeData textTheme});

  @override
  $AppColorThemeDataCopyWith<$Res> get colorTheme;
  @override
  $AppTextThemeDataCopyWith<$Res> get textTheme;
}

/// @nodoc
class __$$AppThemeDataImplCopyWithImpl<$Res>
    extends _$AppThemeDataCopyWithImpl<$Res, _$AppThemeDataImpl>
    implements _$$AppThemeDataImplCopyWith<$Res> {
  __$$AppThemeDataImplCopyWithImpl(
      _$AppThemeDataImpl _value, $Res Function(_$AppThemeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? materialThemeData = null,
    Object? colorTheme = null,
    Object? textTheme = null,
  }) {
    return _then(_$AppThemeDataImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      materialThemeData: null == materialThemeData
          ? _value.materialThemeData
          : materialThemeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      colorTheme: null == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as AppColorThemeData,
      textTheme: null == textTheme
          ? _value.textTheme
          : textTheme // ignore: cast_nullable_to_non_nullable
              as AppTextThemeData,
    ));
  }
}

/// @nodoc

class _$AppThemeDataImpl extends _AppThemeData {
  const _$AppThemeDataImpl(
      {required this.mode,
      required this.materialThemeData,
      required this.colorTheme,
      required this.textTheme})
      : super._();

  @override
  final ThemeMode mode;
  @override
  final ThemeData materialThemeData;
  @override
  final AppColorThemeData colorTheme;
  @override
  final AppTextThemeData textTheme;

  @override
  String toString() {
    return 'AppThemeData(mode: $mode, materialThemeData: $materialThemeData, colorTheme: $colorTheme, textTheme: $textTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppThemeDataImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.materialThemeData, materialThemeData) ||
                other.materialThemeData == materialThemeData) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.textTheme, textTheme) ||
                other.textTheme == textTheme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mode, materialThemeData, colorTheme, textTheme);

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppThemeDataImplCopyWith<_$AppThemeDataImpl> get copyWith =>
      __$$AppThemeDataImplCopyWithImpl<_$AppThemeDataImpl>(this, _$identity);
}

abstract class _AppThemeData extends AppThemeData {
  const factory _AppThemeData(
      {required final ThemeMode mode,
      required final ThemeData materialThemeData,
      required final AppColorThemeData colorTheme,
      required final AppTextThemeData textTheme}) = _$AppThemeDataImpl;
  const _AppThemeData._() : super._();

  @override
  ThemeMode get mode;
  @override
  ThemeData get materialThemeData;
  @override
  AppColorThemeData get colorTheme;
  @override
  AppTextThemeData get textTheme;

  /// Create a copy of AppThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppThemeDataImplCopyWith<_$AppThemeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
