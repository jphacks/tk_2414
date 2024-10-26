import 'package:fair_edu_mobile/domain/usecase/get_head_line_list.dart';
import 'package:fair_edu_mobile/domain/usecase/get_material_list.dart';
import 'package:fair_edu_mobile/domain/usecase/get_message.dart';
import 'package:fair_edu_mobile/domain/usecase/list_chat.dart';
import 'package:fair_edu_mobile/domain/usecase/post_message.dart';
import 'package:fair_edu_mobile/infrastructure/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(dependencies: [
  materialRepository,
])
IGetMaterialListUseCase getMaterialListUseCase(GetMaterialListUseCaseRef ref) {
  return GetMaterialListUseCase(
    materialRepository: ref.watch(materialRepositoryProvider),
  );
}

@Riverpod(
  dependencies: [
    lectureRepository,
  ],
)
IGetHeadLineUseCase getHeadLineUseCase(GetHeadLineUseCaseRef ref) {
  return GetHeadLineUseCase(
    lectureRepository: ref.watch(lectureRepositoryProvider),
  );
}

@Riverpod(
  dependencies: [
    messageRepository,
  ],
)
IListChatUseCase listChatUseCase(ListChatUseCaseRef ref) {
  return ListChatUseCase(
    messageRepository: ref.watch(messageRepositoryProvider),
  );
}

@Riverpod(
  dependencies: [
    messageRepository,
  ],
)
IGetMessageUseCase getMessageUseCase(GetMessageUseCaseRef ref) {
  return GetMessageUseCase(
    messageRepository: ref.watch(messageRepositoryProvider),
  );
}

@Riverpod(
  dependencies: [
    messageRepository,
  ],
)
IPostMessageUseCase postMessageUseCase(PostMessageUseCaseRef ref) {
  return PostMessageUseCase(
    messageRepository: ref.watch(messageRepositoryProvider),
  );
}
