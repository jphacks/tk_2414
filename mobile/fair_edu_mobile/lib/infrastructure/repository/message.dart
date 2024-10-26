import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/model/utils/utils.dart';
import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fairedu_client/api.dart';
import 'package:uuid/uuid_value.dart';

class MessageRepository implements IMessageRepository {
  const MessageRepository({
    required ChatApi chatClient,
  }) : _chatClient = chatClient;

  final ChatApi _chatClient;

  @override
  Future<List<UuidValue>> getChatIdList({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    final chatIdList = await _chatClient.getChatsByUserIDAndLectureID(
      userId.uuid,
      lectureId.uuid,
    );
    print('ChatIdList: $chatIdList');
    if (chatIdList == null || chatIdList.isEmpty) {
      return [];
    }
    return chatIdList.map((chat) {
      return UuidValue.fromString(chat.chatId!);
    }).toList();
  }

  @override
  Future<List<MessageEntity>> getMessageList({
    required UuidValue chatId,
  }) async {
    final messageList = await _chatClient.getMessagesByChatID(
      chatId.uuid,
    );

    if (messageList == null || messageList.isEmpty) {
      return [];
    }
    return messageList.map((message) {
      return MessageEntity(
          id: UuidValue.fromString("aaa"),
          message: message.message ?? '',
          chatId: chatId,
          isUser: message.isUser ?? false,
          createdAt: localDateTimeFromDateTimeJson(message.createdAt!));
    }).toList();
  }

  @override
  Future<void> createChat({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  }) async {
    await _chatClient.processMessage(
        userId.uuid,
        lectureId.uuid,
        ProcessMessageRequest(
          chatId: chatId?.uuid,
          message: message,
        ));
  }
}
