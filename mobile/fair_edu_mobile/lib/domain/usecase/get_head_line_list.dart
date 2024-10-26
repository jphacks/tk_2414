import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/repository/lecture.dart';
import 'package:fair_edu_mobile/domain/utils/utils.dart';
import 'package:fair_edu_mobile/helper/logger.dart';
import 'package:uuid/uuid.dart';

abstract class IGetHeadLineUseCase {
  Future<List<HeadLineEntity>> execute({
    required UuidValue lectureId,
  });
}

class GetHeadLineUseCase implements IGetHeadLineUseCase {
  const GetHeadLineUseCase({
    required ILectureRepository lectureRepository,
  }) : _lectureRepository = lectureRepository;

  final ILectureRepository _lectureRepository;

  @override
  Future<List<HeadLineEntity>> execute({
    required UuidValue lectureId,
  }) async {
    final logger = CustomLogger(
      debugLabel: 'DeleteIncidentUseCase',
    );
    return useCaseExceptionLogger(
      logger: logger,
      action: () async {
        return await _lectureRepository.getHeadLineList(
          lectureId: lectureId,
        );
      },
    );
  }
}
