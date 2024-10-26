import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/domain/repository/material.dart';
import 'package:fairedu_client/api.dart';
import 'package:uuid/uuid_value.dart';

class MaterialRepository implements IMaterialRepository {
  const MaterialRepository({
    required MaterialApi materialClient,
  }) : _materialClient = materialClient;

  final MaterialApi _materialClient;

  @override
  Future<List<SegmentEntity>> getMaterialList({
    required UuidValue lectureId,
  }) async {
    final segmentList = await _materialClient.getMaterialsForLecture(
      lectureId.uuid,
    );
    print('SegmentList: $segmentList');
    if (segmentList == null) {
      return [];
    }
    return segmentList.map((material) {
      return SegmentEntity(
        id: UuidValue.fromString(material.segmentId ?? ''),
        voiceUrl: material.voice ?? '',
        content: material.content ?? '',
      );
    }).toList();
  }
}
