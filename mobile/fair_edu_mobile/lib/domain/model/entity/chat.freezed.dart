// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) {
  return _ChatEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatEntity {
  @UuidValueJsonConverter()
  UuidValue get chatId => throw _privateConstructorUsedError;
  @UuidValueJsonConverter()
  UuidValue get segmentId => throw _privateConstructorUsedError;
  @LocalDateTimeJsonConverter()
  List<MessageEntity> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatEntityCopyWith<ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEntityCopyWith<$Res> {
  factory $ChatEntityCopyWith(
          ChatEntity value, $Res Function(ChatEntity) then) =
      _$ChatEntityCopyWithImpl<$Res, ChatEntity>;
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue chatId,
      @UuidValueJsonConverter() UuidValue segmentId,
      @LocalDateTimeJsonConverter() List<MessageEntity> messages});
}

/// @nodoc
class _$ChatEntityCopyWithImpl<$Res, $Val extends ChatEntity>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? segmentId = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      segmentId: null == segmentId
          ? _value.segmentId
          : segmentId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatEntityImplCopyWith<$Res>
    implements $ChatEntityCopyWith<$Res> {
  factory _$$ChatEntityImplCopyWith(
          _$ChatEntityImpl value, $Res Function(_$ChatEntityImpl) then) =
      __$$ChatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidValueJsonConverter() UuidValue chatId,
      @UuidValueJsonConverter() UuidValue segmentId,
      @LocalDateTimeJsonConverter() List<MessageEntity> messages});
}

/// @nodoc
class __$$ChatEntityImplCopyWithImpl<$Res>
    extends _$ChatEntityCopyWithImpl<$Res, _$ChatEntityImpl>
    implements _$$ChatEntityImplCopyWith<$Res> {
  __$$ChatEntityImplCopyWithImpl(
      _$ChatEntityImpl _value, $Res Function(_$ChatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? segmentId = null,
    Object? messages = null,
  }) {
    return _then(_$ChatEntityImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      segmentId: null == segmentId
          ? _value.segmentId
          : segmentId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatEntityImpl implements _ChatEntity {
  _$ChatEntityImpl(
      {@UuidValueJsonConverter() required this.chatId,
      @UuidValueJsonConverter() required this.segmentId,
      @LocalDateTimeJsonConverter()
      required final List<MessageEntity> messages})
      : _messages = messages;

  factory _$ChatEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatEntityImplFromJson(json);

  @override
  @UuidValueJsonConverter()
  final UuidValue chatId;
  @override
  @UuidValueJsonConverter()
  final UuidValue segmentId;
  final List<MessageEntity> _messages;
  @override
  @LocalDateTimeJsonConverter()
  List<MessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatEntity(chatId: $chatId, segmentId: $segmentId, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEntityImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.segmentId, segmentId) ||
                other.segmentId == segmentId) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chatId, segmentId,
      const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      __$$ChatEntityImplCopyWithImpl<_$ChatEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatEntityImplToJson(
      this,
    );
  }
}

abstract class _ChatEntity implements ChatEntity {
  factory _ChatEntity(
      {@UuidValueJsonConverter() required final UuidValue chatId,
      @UuidValueJsonConverter() required final UuidValue segmentId,
      @LocalDateTimeJsonConverter()
      required final List<MessageEntity> messages}) = _$ChatEntityImpl;

  factory _ChatEntity.fromJson(Map<String, dynamic> json) =
      _$ChatEntityImpl.fromJson;

  @override
  @UuidValueJsonConverter()
  UuidValue get chatId;
  @override
  @UuidValueJsonConverter()
  UuidValue get segmentId;
  @override
  @LocalDateTimeJsonConverter()
  List<MessageEntity> get messages;

  /// Create a copy of ChatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatEntityImplCopyWith<_$ChatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
