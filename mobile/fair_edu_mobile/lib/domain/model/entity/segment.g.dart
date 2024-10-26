// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SegmentEntityImpl _$$SegmentEntityImplFromJson(Map<String, dynamic> json) =>
    _$SegmentEntityImpl(
      id: const UuidValueJsonConverter().fromJson(json['id'] as String),
      voiceUrl: json['voiceUrl'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$SegmentEntityImplToJson(_$SegmentEntityImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueJsonConverter().toJson(instance.id),
      'voiceUrl': instance.voiceUrl,
      'content': instance.content,
    };
