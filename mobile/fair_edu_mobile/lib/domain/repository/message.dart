import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:uuid/uuid.dart';

abstract interface class IMessageRepository {
  //MEMO 授業ごとに全てのチャットのIDのリストを取得する
  Future<List<UuidValue>> getChatIdList({
    required UuidValue userId,
    required UuidValue lectureId,
  });

  //MEMO チャットIdwを指定してチャットのメッセージリストを取得する
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
