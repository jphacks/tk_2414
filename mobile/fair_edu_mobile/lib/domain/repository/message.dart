import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:uuid/uuid.dart';

abstract interface class IMessageRepository {
  //?MEMO lecture_idに紐づくmessageデータを取得する
  Future<List<ChatEntity>> getChatList({
    required UuidValue chatId,
    required UuidValue lectureId,
  });

  //?MEMO これは不要
  Future<List<MessageEntity>> getMessageList({
    required UuidValue chatId,
  });

  Future<void> createChat({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  });
}
