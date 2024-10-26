import 'package:fair_edu_mobile/domain/model/utils/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';

@freezed
class LectureEntity with _$LectureEntity {
  factory LectureEntity({
    @UuidValueJsonConverter() required UuidValue id,
  }) = _LectureEntity;

  factory LectureEntity.fromJson(Map<String, dynamic> json) =>
      _$LectureEntityFromJson(json);
}
