// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatEntityImpl _$$ChatEntityImplFromJson(Map<String, dynamic> json) =>
    _$ChatEntityImpl(
      chatId: const UuidValueJsonConverter().fromJson(json['chatId'] as String),
      segmentId:
          const UuidValueJsonConverter().fromJson(json['segmentId'] as String),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatEntityImplToJson(_$ChatEntityImpl instance) =>
    <String, dynamic>{
      'chatId': const UuidValueJsonConverter().toJson(instance.chatId),
      'segmentId': const UuidValueJsonConverter().toJson(instance.segmentId),
      'messages': instance.messages,
    };
