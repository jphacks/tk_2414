import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/domain/repository/material.dart';
import 'package:fair_edu_mobile/infrastructure/data/mock/fake.dart';
import 'package:uuid/uuid_value.dart';

class MockMaterialRepository implements IMaterialRepository {
  const MockMaterialRepository({
    required CustomFaker faker,
  }) : _faker = faker;

  final CustomFaker _faker;

  @override
  Future<List<SegmentEntity>> getMaterialList({
    required UuidValue lectureId,
  }) async {
    final segmentList = List.generate(5, (index) {
      return _faker.getSegment();
    });
    return segmentList;
  }
}
