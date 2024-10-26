import 'package:fair_edu_mobile/domain/model/utils/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_machine/time_machine.dart';
import 'package:uuid/uuid.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class MessageEntity with _$MessageEntity {
  factory MessageEntity({
    @UuidValueJsonConverter() required UuidValue id,
    required String message,
    @UuidValueJsonConverter() required UuidValue chatId,
    required bool isUser,
    @LocalDateTimeJsonConverter() required LocalDateTime createdAt,
  }) = _MessageEntity;

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}
