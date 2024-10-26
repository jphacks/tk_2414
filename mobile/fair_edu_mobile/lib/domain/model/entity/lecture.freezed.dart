// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LectureEntity _$LectureEntityFromJson(Map<String, dynamic> json) {
  return _LectureEntity.fromJson(json);
}

/// @nodoc
mixin _$LectureEntity {
  @UuidValueJsonConverter()
  UuidValue get id => throw _privateConstructorUsedError;

  /// Serializes this LectureEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LectureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LectureEntityCopyWith<LectureEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureEntityCopyWith<$Res> {
  factory $LectureEntityCopyWith(
          LectureEntity value, $Res Function(LectureEntity) then) =
      _$LectureEntityCopyWithImpl<$Res, LectureEntity>;
  @useResult
  $Res call({@UuidValueJsonConverter() UuidValue id});
}

/// @nodoc
class _$LectureEntityCopyWithImpl<$Res, $Val extends LectureEntity>
    implements $LectureEntityCopyWith<$Res> {
  _$LectureEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LectureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LectureEntityImplCopyWith<$Res>
    implements $LectureEntityCopyWith<$Res> {
  factory _$$LectureEntityImplCopyWith(
          _$LectureEntityImpl value, $Res Function(_$LectureEntityImpl) then) =
      __$$LectureEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@UuidValueJsonConverter() UuidValue id});
}

/// @nodoc
class __$$LectureEntityImplCopyWithImpl<$Res>
    extends _$LectureEntityCopyWithImpl<$Res, _$LectureEntityImpl>
    implements _$$LectureEntityImplCopyWith<$Res> {
  __$$LectureEntityImplCopyWithImpl(
      _$LectureEntityImpl _value, $Res Function(_$LectureEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LectureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LectureEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LectureEntityImpl implements _LectureEntity {
  _$LectureEntityImpl({@UuidValueJsonConverter() required this.id});

  factory _$LectureEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LectureEntityImplFromJson(json);

  @override
  @UuidValueJsonConverter()
  final UuidValue id;

  @override
  String toString() {
    return 'LectureEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LectureEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of LectureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureEntityImplCopyWith<_$LectureEntityImpl> get copyWith =>
      __$$LectureEntityImplCopyWithImpl<_$LectureEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LectureEntityImplToJson(
      this,
    );
  }
}

abstract class _LectureEntity implements LectureEntity {
  factory _LectureEntity(
          {@UuidValueJsonConverter() required final UuidValue id}) =
      _$LectureEntityImpl;

  factory _LectureEntity.fromJson(Map<String, dynamic> json) =
      _$LectureEntityImpl.fromJson;

  @override
  @UuidValueJsonConverter()
  UuidValue get id;

  /// Create a copy of LectureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LectureEntityImplCopyWith<_$LectureEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
