import 'package:fair_edu_mobile/domain/model/utils/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'segment.freezed.dart';
part 'segment.g.dart';

@freezed
class SegmentEntity with _$SegmentEntity {
  factory SegmentEntity({
    @UuidValueJsonConverter() required UuidValue id,
    required String voiceUrl,
    required String content,
  }) = _SegmentEntity;

  factory SegmentEntity.fromJson(Map<String, dynamic> json) =>
      _$SegmentEntityFromJson(json);
}
