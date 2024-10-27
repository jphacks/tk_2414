import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/model/utils/utils.dart';
import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fairedu_client/api.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_value.dart';

class MessageRepository implements IMessageRepository {
  const MessageRepository({
    required ChatApi chatClient,
  }) : _chatClient = chatClient;

  final ChatApi _chatClient;

  @override
  Future<List<ChatEntity>> getChatList({
    required UuidValue chatId,
    required UuidValue lectureId,
  }) async {
    final chatIdList = await _chatClient.getChatsByUserIDAndLectureID(
      chatId.uuid,
      lectureId.uuid,
    );

    if (chatIdList == null || chatIdList.isEmpty) {
      return [];
    }

    return chatIdList.map((chat) {
      return ChatEntity(
        chatId: UuidValue.fromString(chat.chatId ?? ''),
        segmentId: UuidValue.fromString(chat.segmentId ?? ''),
        messages: chat.messages.map((message) {
          return MessageEntity(
            id: UuidValue.fromString(message.messageId ?? ''),
            message: message.message ?? '',
            chatId: UuidValue.fromString(chat.chatId ?? ''),
            isUser: message.isUser ?? false,
            createdAt: localDateTimeFromDateTimeJson(message.createdAt!),
          );
        }).toList(),
      );
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
  Future<UuidValue> createChat({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  }) async {
    print("postchatId: $chatId");
    final chat = await _chatClient.processMessage(
        lectureId.uuid,
        userId.uuid,
        ProcessMessageRequest(
          chatId: chatId?.uuid,
          message: message,
        ));

    return UuidValue.fromString(chat?.userMessage?.chatId ?? '');
  }
}
