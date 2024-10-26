import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:uuid/uuid.dart';

abstract interface class ILectureRepository {
  Future<List<HeadLineEntity>> getHeadLineList({
    required UuidValue lectureId,
  });
}
