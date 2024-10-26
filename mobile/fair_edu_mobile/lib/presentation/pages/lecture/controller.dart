import 'package:fair_edu_mobile/application/provider.dart';
import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'controller.g.dart';

@Riverpod(dependencies: [
  getHeadLineUseCase,
])
class ListHeadLineController extends _$ListHeadLineController {
  @override
  Future<List<HeadLineEntity>> build({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getHeadLineUseCaseProvider)
        .execute(lectureId: lectureId);
  }

  Future<List<HeadLineEntity>> get({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getHeadLineUseCaseProvider)
        .execute(lectureId: lectureId);
  }
}

@Riverpod(dependencies: [
  getMaterialListUseCase,
])
class GetMaterialListController extends _$GetMaterialListController {
  @override
  Future<List<SegmentEntity>> build({
    required UuidValue lectureId,
  }) async {
    return await ref
        .read(getMaterialListUseCaseProvider)
        .execute(lectureId: lectureId);
  }
}

@Riverpod(dependencies: [
  listChatUseCase,
])
class ListChatController extends _$ListChatController {
  @override
  Future<List<ChatEntity>> build({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    return await ref.read(listChatUseCaseProvider).execute(
          userId: userId,
          lectureId: lectureId,
        );
  }
}

// @Riverpod(dependencies: [])
// class SelectMessages extends _$SelectMessages {
//   @override
//   Future<List<types.TextMessage>> build() async {
//     return [];
//     // final chatList = await ref.read(listChatUseCaseProvider).execute(
//     //       userId: chatId,
//     //       lectureId: lectureId,
//     //     );

//     // return chatList.expand((chat) {
//     //   return chat.messages.map((messageEntity) {
//     //     return types.TextMessage(
//     //       author: types.User(id: chatId.uuid),
//     //       createdAt: messageEntity.createdAt.millisecondOfSecond,
//     //       id: messageEntity.id.toString(),
//     //       text: messageEntity.message,
//     //     );
//     //   });
//     // }).toList();
//   }

//   Future<void> select({
//     required UuidValue chatId,
//     required UuidValue lectureId,
//   }) async {
//     state = 
//   }
// }
