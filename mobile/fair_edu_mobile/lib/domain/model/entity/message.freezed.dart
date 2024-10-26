// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return _MessageEntity.fromJson(json);
}

/// @nodoc
mixin _$MessageEntity {
  @UuidValueJsonConverter()
  UuidValue get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @UuidValueJsonConverter()
  UuidValue get chatId => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;
  @LocalDateTimeJsonConverter()
  LocalDateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MessageEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageEntityCopyWith<MessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEntityCopyWith<$Res> {
  factory $MessageEntityCopyWith(
          MessageEntity value, $Res Function(MessageEntity) then) =
      _$MessageEntityCopyWithImpl<$Res, MessageEntity>;
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue id,
      String message,
      @UuidValueJsonConverter() UuidValue chatId,
      bool isUser,
      @LocalDateTimeJsonConverter() LocalDateTime createdAt});
}

/// @nodoc
class _$MessageEntityCopyWithImpl<$Res, $Val extends MessageEntity>
    implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? chatId = null,
    Object? isUser = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as LocalDateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageEntityImplCopyWith<$Res>
    implements $MessageEntityCopyWith<$Res> {
  factory _$$MessageEntityImplCopyWith(
          _$MessageEntityImpl value, $Res Function(_$MessageEntityImpl) then) =
      __$$MessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue id,
      String message,
      @UuidValueJsonConverter() UuidValue chatId,
      bool isUser,
      @LocalDateTimeJsonConverter() LocalDateTime createdAt});
}

/// @nodoc
class __$$MessageEntityImplCopyWithImpl<$Res>
    extends _$MessageEntityCopyWithImpl<$Res, _$MessageEntityImpl>
    implements _$$MessageEntityImplCopyWith<$Res> {
  __$$MessageEntityImplCopyWithImpl(
      _$MessageEntityImpl _value, $Res Function(_$MessageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? chatId = null,
    Object? isUser = null,
    Object? createdAt = null,
  }) {
    return _then(_$MessageEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as LocalDateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageEntityImpl implements _MessageEntity {
  _$MessageEntityImpl(
      {@UuidValueJsonConverter() required this.id,
      required this.message,
      @UuidValueJsonConverter() required this.chatId,
      required this.isUser,
      @LocalDateTimeJsonConverter() required this.createdAt});

  factory _$MessageEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageEntityImplFromJson(json);

  @override
  @UuidValueJsonConverter()
  final UuidValue id;
  @override
  final String message;
  @override
  @UuidValueJsonConverter()
  final UuidValue chatId;
  @override
  final bool isUser;
  @override
  @LocalDateTimeJsonConverter()
  final LocalDateTime createdAt;

  @override
  String toString() {
    return 'MessageEntity(id: $id, message: $message, chatId: $chatId, isUser: $isUser, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, message, chatId, isUser, createdAt);

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith =>
      __$$MessageEntityImplCopyWithImpl<_$MessageEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageEntityImplToJson(
      this,
    );
  }
}

abstract class _MessageEntity implements MessageEntity {
  factory _MessageEntity(
      {@UuidValueJsonConverter() required final UuidValue id,
      required final String message,
      @UuidValueJsonConverter() required final UuidValue chatId,
      required final bool isUser,
      @LocalDateTimeJsonConverter()
      required final LocalDateTime createdAt}) = _$MessageEntityImpl;

  factory _MessageEntity.fromJson(Map<String, dynamic> json) =
      _$MessageEntityImpl.fromJson;

  @override
  @UuidValueJsonConverter()
  UuidValue get id;
  @override
  String get message;
  @override
  @UuidValueJsonConverter()
  UuidValue get chatId;
  @override
  bool get isUser;
  @override
  @LocalDateTimeJsonConverter()
  LocalDateTime get createdAt;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
