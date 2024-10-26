import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
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
  Future<List<ChatEntity>> getChatList({
    required UuidValue chatId,
    required UuidValue lectureId,
  }) async {
    final chatList = List.generate(5, (index) {
      return _faker.getChatEntity();
    });

    return chatList;
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
