import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/repository/lecture.dart';
import 'package:fair_edu_mobile/infrastructure/data/mock/fake.dart';
import 'package:uuid/uuid_value.dart';

class MockLectureRepository implements ILectureRepository {
  const MockLectureRepository({
    required CustomFaker faker,
  }) : _faker = faker;

  final CustomFaker _faker;

  @override
  Future<List<HeadLineEntity>> getHeadLineList({
    required UuidValue lectureId,
  }) async {
    // _faker.getHeadLineEntity()はentityを返すだけのメソッドなので、配列になるように変更
    final headLineList = List.generate(5, (index) {
      return _faker.getHeadLineEntity();
    });
    return headLineList;
  }
}
