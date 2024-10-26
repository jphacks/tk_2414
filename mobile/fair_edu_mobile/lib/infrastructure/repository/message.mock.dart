import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fair_edu_mobile/infrastructure/data/mock/fake.dart';
import 'package:uuid/uuid_value.dart';

class MockMessageRepository implements IMessageRepository {
  const MockMessageRepository({
    required CustomFaker faker,
  }) : _faker = faker;

  final CustomFaker _faker;

  @override
  Future<List<UuidValue>> getChatIdList({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    final chatIdList = List.generate(5, (index) {
      return UuidValue.fromString(_faker.getId());
    });
    return chatIdList;
  }

  @override
  Future<List<MessageEntity>> getMessageList({
    required UuidValue chatId,
  }) async {
    final messageList = List.generate(5, (index) {
      return _faker.getMessageEntity();
    });
    return messageList;
  }

  @override
  Future<void> createChat({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  }) async {
    return;
  }
}
