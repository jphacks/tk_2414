// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageEntityImpl _$$MessageEntityImplFromJson(Map<String, dynamic> json) =>
    _$MessageEntityImpl(
      id: const UuidValueJsonConverter().fromJson(json['id'] as String),
      message: json['message'] as String,
      chatId: const UuidValueJsonConverter().fromJson(json['chatId'] as String),
      isUser: json['isUser'] as bool,
      createdAt: const LocalDateTimeJsonConverter()
          .fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageEntityImplToJson(_$MessageEntityImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueJsonConverter().toJson(instance.id),
      'message': instance.message,
      'chatId': const UuidValueJsonConverter().toJson(instance.chatId),
      'isUser': instance.isUser,
      'createdAt':
          const LocalDateTimeJsonConverter().toJson(instance.createdAt),
    };
