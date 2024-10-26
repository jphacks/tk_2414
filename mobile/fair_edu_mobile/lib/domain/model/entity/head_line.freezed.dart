// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'head_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HeadLineEntity _$HeadLineEntityFromJson(Map<String, dynamic> json) {
  return _HeadLineEntity.fromJson(json);
}

/// @nodoc
mixin _$HeadLineEntity {
  String get name => throw _privateConstructorUsedError;
  HeadType get type => throw _privateConstructorUsedError;

  /// Serializes this HeadLineEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeadLineEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeadLineEntityCopyWith<HeadLineEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeadLineEntityCopyWith<$Res> {
  factory $HeadLineEntityCopyWith(
          HeadLineEntity value, $Res Function(HeadLineEntity) then) =
      _$HeadLineEntityCopyWithImpl<$Res, HeadLineEntity>;
  @useResult
  $Res call({String name, HeadType type});
}

/// @nodoc
class _$HeadLineEntityCopyWithImpl<$Res, $Val extends HeadLineEntity>
    implements $HeadLineEntityCopyWith<$Res> {
  _$HeadLineEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeadLineEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HeadType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeadLineEntityImplCopyWith<$Res>
    implements $HeadLineEntityCopyWith<$Res> {
  factory _$$HeadLineEntityImplCopyWith(_$HeadLineEntityImpl value,
          $Res Function(_$HeadLineEntityImpl) then) =
      __$$HeadLineEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, HeadType type});
}

/// @nodoc
class __$$HeadLineEntityImplCopyWithImpl<$Res>
    extends _$HeadLineEntityCopyWithImpl<$Res, _$HeadLineEntityImpl>
    implements _$$HeadLineEntityImplCopyWith<$Res> {
  __$$HeadLineEntityImplCopyWithImpl(
      _$HeadLineEntityImpl _value, $Res Function(_$HeadLineEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HeadLineEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$HeadLineEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HeadType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeadLineEntityImpl implements _HeadLineEntity {
  _$HeadLineEntityImpl({required this.name, required this.type});

  factory _$HeadLineEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeadLineEntityImplFromJson(json);

  @override
  final String name;
  @override
  final HeadType type;

  @override
  String toString() {
    return 'HeadLineEntity(name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadLineEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type);

  /// Create a copy of HeadLineEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadLineEntityImplCopyWith<_$HeadLineEntityImpl> get copyWith =>
      __$$HeadLineEntityImplCopyWithImpl<_$HeadLineEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeadLineEntityImplToJson(
      this,
    );
  }
}

abstract class _HeadLineEntity implements HeadLineEntity {
  factory _HeadLineEntity(
      {required final String name,
      required final HeadType type}) = _$HeadLineEntityImpl;

  factory _HeadLineEntity.fromJson(Map<String, dynamic> json) =
      _$HeadLineEntityImpl.fromJson;

  @override
  String get name;
  @override
  HeadType get type;

  /// Create a copy of HeadLineEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeadLineEntityImplCopyWith<_$HeadLineEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
