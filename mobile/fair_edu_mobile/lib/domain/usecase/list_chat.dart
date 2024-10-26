import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fair_edu_mobile/domain/utils/utils.dart';
import 'package:fair_edu_mobile/helper/logger.dart';
import 'package:uuid/uuid.dart';

abstract class IListChatUseCase {
  Future<List<UuidValue>> execute({
    required UuidValue userId,
    required UuidValue lectureId,
  });
}

class ListChatUseCase implements IListChatUseCase {
  const ListChatUseCase({
    required IMessageRepository messageRepository,
  }) : _messageRepository = messageRepository;

  final IMessageRepository _messageRepository;

  @override
  Future<List<UuidValue>> execute({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    final logger = CustomLogger(
      debugLabel: 'DeleteIncidentUseCase',
    );
    return useCaseExceptionLogger(
      logger: logger,
      action: () async {
        return await _messageRepository.getChatIdList(
          userId: userId,
          lectureId: lectureId,
        );
      },
    );
  }
}
