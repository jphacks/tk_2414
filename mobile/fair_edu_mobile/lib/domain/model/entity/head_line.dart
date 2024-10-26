import 'package:fair_edu_mobile/domain/model/enum/head_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'head_line.freezed.dart';
part 'head_line.g.dart';

@freezed
class HeadLineEntity with _$HeadLineEntity {
  factory HeadLineEntity({
    required String name,
    required HeadType type,
  }) = _HeadLineEntity;

  factory HeadLineEntity.fromJson(Map<String, dynamic> json) =>
      _$HeadLineEntityFromJson(json);
}
