import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/domain/repository/material.dart';
import 'package:fair_edu_mobile/domain/utils/utils.dart';
import 'package:fair_edu_mobile/helper/logger.dart';
import 'package:uuid/uuid.dart';

abstract class IGetMaterialListUseCase {
  Future<List<SegmentEntity>> execute({
    required UuidValue lectureId,
  });
}

class GetMaterialListUseCase implements IGetMaterialListUseCase {
  const GetMaterialListUseCase({
    required IMaterialRepository materialRepository,
  }) : _materialRepository = materialRepository;

  final IMaterialRepository _materialRepository;

  @override
  Future<List<SegmentEntity>> execute({
    required UuidValue lectureId,
  }) async {
    final logger = CustomLogger(
      debugLabel: 'DeleteIncidentUseCase',
    );
    return useCaseExceptionLogger(
      logger: logger,
      action: () async {
        return await _materialRepository.getMaterialList(
          lectureId: lectureId,
        );
      },
    );
  }
}
