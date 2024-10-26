import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fair_edu_mobile/domain/utils/utils.dart';
import 'package:fair_edu_mobile/helper/logger.dart';
import 'package:uuid/uuid.dart';

abstract class IGetMessageUseCase {
  Future<List<MessageEntity>> execute({
    required UuidValue chatId,
  });
}

class GetMessageUseCase implements IGetMessageUseCase {
  const GetMessageUseCase({
    required IMessageRepository messageRepository,
  }) : _messageRepository = messageRepository;

  final IMessageRepository _messageRepository;

  @override
  Future<List<MessageEntity>> execute({
    required UuidValue chatId,
  }) async {
    final logger = CustomLogger(
      debugLabel: 'DeleteIncidentUseCase',
    );
    return useCaseExceptionLogger(
      logger: logger,
      action: () async {
        return await _messageRepository.getMessageList(
          chatId: chatId,
        );
      },
    );
  }
}
