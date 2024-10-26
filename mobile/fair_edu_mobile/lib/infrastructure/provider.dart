import 'package:fair_edu_mobile/domain/repository/lecture.dart';
import 'package:fair_edu_mobile/domain/repository/material.dart';
import 'package:fair_edu_mobile/domain/repository/message.dart';
import 'package:fair_edu_mobile/infrastructure/repository/lecture.dart';
import 'package:fair_edu_mobile/infrastructure/repository/material.dart';
import 'package:fair_edu_mobile/infrastructure/repository/message.dart';
import 'package:fairedu_client/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
IMaterialRepository materialRepository(
  MaterialRepositoryRef ref,
) {
  return MaterialRepository(materialClient: MaterialApi());
}

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
ILectureRepository lectureRepository(
  LectureRepositoryRef ref,
) {
  return LectureRepository(lectureStructureClient: LectureStructureApi());
}

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
IMessageRepository messageRepository(
  MessageRepositoryRef ref,
) {
  return MessageRepository(
    chatClient: ChatApi(),
  );
}
