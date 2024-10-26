import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/entity/message.dart';
import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/domain/model/enum/head_type.dart';
import 'package:faker/faker.dart';
import 'package:time_machine/time_machine.dart';
import 'package:uuid/uuid.dart';

// extension AddressEx on Address {
//   String get fullAddress =>
//       '${buildingNumber()} ${streetName()}, ${city()}, ${state()}, ${zipCode()}';
// }

final defaultCustomFaker = CustomFaker(faker: Faker());

class CustomFaker {
  const CustomFaker({
    required this.faker,
  });

  final Faker faker;

  ///================================================================================================
  ///
  /// Primitive
  ///
  ///================================================================================================
  int getInt([int max = 100, int min = 0]) =>
      faker.randomGenerator.integer(max, min: min);

  bool getBool() => faker.randomGenerator.boolean();

  String getString() => faker.lorem.word();

  UuidValue getUuidValue() => const Uuid().v7obj();

  LocalDateTime getLocalDateTime() => LocalDateTime.dateTime(
        faker.date.dateTime(minYear: 2000, maxYear: LocalDate.today().year),
      );

  Uri getUri() => Uri.parse(faker.internet.httpsUrl());

  Uri getImageUri() => Uri.parse(
        'https://picsum.photos/800',
      );

  String getId() => getUuidValue().toString();

  ///================================================================================================
  ///
  /// Enum
  ///
  ///================================================================================================
  ///================================================================================================
  ///
  /// Extension Type
  ///
  ///================================================================================================
  ///================================================================================================
  ///
  /// Entity
  ///
  ///================================================================================================

  SegmentEntity getSegment() => SegmentEntity(
        id: getUuidValue(),
        voiceUrl: getString(),
        content: getString(),
      );

  HeadLineEntity getHeadLineEntity() => HeadLineEntity(
        name: 'name',
        type: HeadType.h1,
      );

  MessageEntity getMessageEntity() => MessageEntity(
        id: getUuidValue(),
        message: getString(),
        chatId: getUuidValue(),
        isUser: getBool(),
        createdAt: getLocalDateTime(),
      );

  ChatEntity getChatEntity() => ChatEntity(
        chatId: getUuidValue(),
        segmentId: getUuidValue(),
        messages: List.generate(5, (index) {
          return getMessageEntity();
        }),
      );
}
