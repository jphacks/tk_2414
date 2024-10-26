import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_machine/time_machine.dart';
import 'package:uuid/uuid.dart';

class UuidValueJsonConverter implements JsonConverter<UuidValue, String> {
  const UuidValueJsonConverter();

  @override
  UuidValue fromJson(String json) => UuidValue.fromString(json);

  @override
  String toJson(UuidValue object) => object.toString();
}

class LocalDateTimeJsonConverter
    implements JsonConverter<LocalDateTime, String> {
  const LocalDateTimeJsonConverter();

  @override
  LocalDateTime fromJson(String json) =>
      LocalDateTime.dateTime(DateTime.parse(json).toLocal());

  @override
  String toJson(LocalDateTime object) => object
      .inZoneStrictly(DateTimeZone.local)
      .toDateTimeUtc()
      .toIso8601String();
}
