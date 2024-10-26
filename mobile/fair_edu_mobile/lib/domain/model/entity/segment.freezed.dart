// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SegmentEntity _$SegmentEntityFromJson(Map<String, dynamic> json) {
  return _SegmentEntity.fromJson(json);
}

/// @nodoc
mixin _$SegmentEntity {
  @UuidValueJsonConverter()
  UuidValue get id => throw _privateConstructorUsedError;
  String get voiceUrl => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this SegmentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SegmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SegmentEntityCopyWith<SegmentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentEntityCopyWith<$Res> {
  factory $SegmentEntityCopyWith(
          SegmentEntity value, $Res Function(SegmentEntity) then) =
      _$SegmentEntityCopyWithImpl<$Res, SegmentEntity>;
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue id,
      String voiceUrl,
      String content});
}

/// @nodoc
class _$SegmentEntityCopyWithImpl<$Res, $Val extends SegmentEntity>
    implements $SegmentEntityCopyWith<$Res> {
  _$SegmentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SegmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voiceUrl = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SegmentEntityImplCopyWith<$Res>
    implements $SegmentEntityCopyWith<$Res> {
  factory _$$SegmentEntityImplCopyWith(
          _$SegmentEntityImpl value, $Res Function(_$SegmentEntityImpl) then) =
      __$$SegmentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue id,
      String voiceUrl,
      String content});
}

/// @nodoc
class __$$SegmentEntityImplCopyWithImpl<$Res>
    extends _$SegmentEntityCopyWithImpl<$Res, _$SegmentEntityImpl>
    implements _$$SegmentEntityImplCopyWith<$Res> {
  __$$SegmentEntityImplCopyWithImpl(
      _$SegmentEntityImpl _value, $Res Function(_$SegmentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SegmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voiceUrl = null,
    Object? content = null,
  }) {
    return _then(_$SegmentEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SegmentEntityImpl implements _SegmentEntity {
  _$SegmentEntityImpl(
      {@UuidValueJsonConverter() required this.id,
      required this.voiceUrl,
      required this.content});

  factory _$SegmentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SegmentEntityImplFromJson(json);

  @override
  @UuidValueJsonConverter()
  final UuidValue id;
  @override
  final String voiceUrl;
  @override
  final String content;

  @override
  String toString() {
    return 'SegmentEntity(id: $id, voiceUrl: $voiceUrl, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SegmentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, voiceUrl, content);

  /// Create a copy of SegmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SegmentEntityImplCopyWith<_$SegmentEntityImpl> get copyWith =>
      __$$SegmentEntityImplCopyWithImpl<_$SegmentEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SegmentEntityImplToJson(
      this,
    );
  }
}

abstract class _SegmentEntity implements SegmentEntity {
  factory _SegmentEntity(
      {@UuidValueJsonConverter() required final UuidValue id,
      required final String voiceUrl,
      required final String content}) = _$SegmentEntityImpl;

  factory _SegmentEntity.fromJson(Map<String, dynamic> json) =
      _$SegmentEntityImpl.fromJson;

  @override
  @UuidValueJsonConverter()
  UuidValue get id;
  @override
  String get voiceUrl;
  @override
  String get content;

  /// Create a copy of SegmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SegmentEntityImplCopyWith<_$SegmentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
