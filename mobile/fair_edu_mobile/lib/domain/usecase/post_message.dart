import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fair_edu_mobile/domain/utils/utils.dart';
import 'package:fair_edu_mobile/helper/logger.dart';
import 'package:uuid/uuid.dart';

abstract class IPostMessageUseCase {
  Future<UuidValue> execute({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  });
}

class PostMessageUseCase implements IPostMessageUseCase {
  const PostMessageUseCase({
    required IMessageRepository messageRepository,
  }) : _messageRepository = messageRepository;

  final IMessageRepository _messageRepository;

  @override
  Future<UuidValue> execute({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  }) async {
    final logger = CustomLogger(
      debugLabel: 'DeleteIncidentUseCase',
    );
    return useCaseExceptionLogger(
      logger: logger,
      action: () async {
        return await _messageRepository.createChat(
          userId: userId,
          lectureId: lectureId,
          chatId: chatId,
          message: message,
        );
      },
    );
  }
}
