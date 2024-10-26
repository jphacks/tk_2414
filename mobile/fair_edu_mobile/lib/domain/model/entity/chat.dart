import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/model/utils/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class ChatEntity with _$ChatEntity {
  factory ChatEntity({
    @UuidValueJsonConverter() required UuidValue chatId,
    @UuidValueJsonConverter() required UuidValue segmentId,
    @LocalDateTimeJsonConverter() required List<MessageEntity> messages,
  }) = _ChatEntity;

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
}
