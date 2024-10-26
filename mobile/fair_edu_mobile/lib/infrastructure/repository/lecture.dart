import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/enum/head_type.dart';
import 'package:fair_edu_mobile/domain/repository/lecture.dart';
import 'package:fairedu_client/api.dart';
import 'package:uuid/uuid_value.dart';

class LectureRepository implements ILectureRepository {
  const LectureRepository({
    required LectureStructureApi lectureStructureClient,
  }) : _lectureStructureClient = lectureStructureClient;

  final LectureStructureApi _lectureStructureClient;

  @override
  Future<List<HeadLineEntity>> getHeadLineList({
    required UuidValue lectureId,
  }) async {
    final headLineList = await _lectureStructureClient.getLectureStructure(
      lectureId.uuid,
    );
    if (headLineList == null) {
      return [];
    }

    return headLineList.map((headLine) {
      return HeadLineEntity(
        name: headLine.name ?? '',
        type: HeadType.fromString(
          headLine.strType?.toString() ?? 'h5',
        ),
      );
    }).toList();
  }
}
