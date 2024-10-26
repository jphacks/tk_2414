import 'package:fair_edu_mobile/application/provider.dart';
import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'controller.g.dart';

@Riverpod(dependencies: [
  getHeadLineUseCase,
])
class ListHeadLineController extends _$ListHeadLineController {
  @override
  Future<List<HeadLineEntity>> build({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getHeadLineUseCaseProvider)
        .execute(lectureId: lectureId);
  }

  Future<List<HeadLineEntity>> get({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getHeadLineUseCaseProvider)
        .execute(lectureId: lectureId);
  }
}

@Riverpod(dependencies: [
  getMaterialListUseCase,
])
class GetMaterialListController extends _$GetMaterialListController {
  @override
  Future<List<SegmentEntity>> build({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getMaterialListUseCaseProvider)
        .execute(lectureId: lectureId);
  }
}
