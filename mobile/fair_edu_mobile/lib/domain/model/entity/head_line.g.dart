// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeadLineEntityImpl _$$HeadLineEntityImplFromJson(Map<String, dynamic> json) =>
    _$HeadLineEntityImpl(
      name: json['name'] as String,
      type: $enumDecode(_$HeadTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$HeadLineEntityImplToJson(
        _$HeadLineEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$HeadTypeEnumMap[instance.type]!,
    };

const _$HeadTypeEnumMap = {
  HeadType.h1: 'h1',
  HeadType.h2: 'h2',
  HeadType.h3: 'h3',
  HeadType.h4: 'h4',
  HeadType.h5: 'h5',
};
