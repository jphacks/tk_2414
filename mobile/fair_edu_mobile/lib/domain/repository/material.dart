import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:uuid/uuid.dart';

abstract interface class IMaterialRepository {
  Future<List<SegmentEntity>> getMaterialList({
    required UuidValue lectureId,
  });
}
