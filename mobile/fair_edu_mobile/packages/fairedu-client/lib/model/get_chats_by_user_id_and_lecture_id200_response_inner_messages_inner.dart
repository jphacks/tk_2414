//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner {
  /// Returns a new [GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner] instance.
  GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner({
    this.messageId,
    this.message,
    this.isUser,
    this.createdAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? messageId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isUser;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner &&
    other.messageId == messageId &&
    other.message == message &&
    other.isUser == isUser &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (messageId == null ? 0 : messageId!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (isUser == null ? 0 : isUser!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() => 'GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner[messageId=$messageId, message=$message, isUser=$isUser, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.messageId != null) {
      json[r'message_id'] = this.messageId;
    } else {
      json[r'message_id'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.isUser != null) {
      json[r'is_user'] = this.isUser;
    } else {
      json[r'is_user'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'created_at'] = null;
    }
    return json;
  }

  /// Returns a new [GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner(
        messageId: mapValueOfType<String>(json, r'message_id'),
        message: mapValueOfType<String>(json, r'message'),
        isUser: mapValueOfType<bool>(json, r'is_user'),
        createdAt: mapDateTime(json, r'created_at', r''),
      );
    }
    return null;
  }

  static List<GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner> mapFromJson(dynamic json) {
    final map = <String, GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner-objects as value to a dart map
  static Map<String, List<GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

