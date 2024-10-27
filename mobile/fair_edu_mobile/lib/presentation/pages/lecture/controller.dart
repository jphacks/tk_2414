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
  // final Set<MessageEntity> _messageSet = {};  // メッセージの重複を防ぐためのSet
  bool _hasMoreMessages = true;

  @override
  Future<List<ChatEntity>> build({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    final chatEntities = await ref.read(listChatUseCaseProvider).execute(
          userId: userId,
          lectureId: lectureId,
        );

    // stateを更新するためのチャットリストを返す
    return chatEntities;
  }

  Future<void> fetch({
    required UuidValue userId,
    required UuidValue lectureId,
  }) async {
    if (!_hasMoreMessages) {
      // すでに全てのメッセージを取得している場合は早期リターン
      return;
    }

    // 新しいメッセージを含むChatEntityを取得
    final newChatEntities = await ref.read(listChatUseCaseProvider).execute(
          userId: userId,
          lectureId: lectureId,
        );

    final currentChatEntities = state.valueOrNull ?? [];

    final updatedChatEntities = currentChatEntities.map((currentChat) {
      final newChat = newChatEntities.firstWhere(
        (newEntity) => newEntity.chatId == currentChat.chatId,
        orElse: () => currentChat,
      );

      final mergedMessages = {
        ...currentChat.messages,
        ...newChat.messages,
      }.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // 降順ソート

      // マージされたメッセージで新しいChatEntityを返す
      return currentChat.copyWith(messages: mergedMessages);
    }).toList();

    // 新しく取得したチャットエンティティが存在しなければ追加
    for (final newChat in newChatEntities) {
      if (!updatedChatEntities.any((chat) => chat.chatId == newChat.chatId)) {
        updatedChatEntities.add(newChat);
      }
    }

    // 新しいデータが空であれば、フラグをオフにする
    _hasMoreMessages = newChatEntities.isNotEmpty;

    // stateを更新
    state = AsyncValue.data(updatedChatEntities);
  }
}

@Riverpod(dependencies: [
  postMessageUseCase,
])
class PostMessage extends _$PostMessage {
  @override
  Future<void> build() async {}

  Future<UuidValue> post({
    required UuidValue userId,
    required UuidValue lectureId,
    required UuidValue? chatId,
    required String message,
  }) async {
    final messageUseCase = ref.read(postMessageUseCaseProvider);

    state = const AsyncValue.loading();

    try {
      final chat = await messageUseCase.execute(
        userId: userId,
        lectureId: lectureId,
        chatId: chatId,
        message: message,
      );

      await ref
          .read(listChatControllerProvider(
            userId: userId,
            lectureId: lectureId,
          ).notifier)
          .fetch(
            userId: userId,
            lectureId: lectureId,
          );

      state = const AsyncValue.data(null);

      return chat;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
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
