//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetChatsByUserIDAndLectureID200ResponseInner {
  /// Returns a new [GetChatsByUserIDAndLectureID200ResponseInner] instance.
  GetChatsByUserIDAndLectureID200ResponseInner({
    this.chatId,
    this.segmentId,
    this.messages = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? chatId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? segmentId;

  List<GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner> messages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetChatsByUserIDAndLectureID200ResponseInner &&
    other.chatId == chatId &&
    other.segmentId == segmentId &&
    _deepEquality.equals(other.messages, messages);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (chatId == null ? 0 : chatId!.hashCode) +
    (segmentId == null ? 0 : segmentId!.hashCode) +
    (messages.hashCode);

  @override
  String toString() => 'GetChatsByUserIDAndLectureID200ResponseInner[chatId=$chatId, segmentId=$segmentId, messages=$messages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.chatId != null) {
      json[r'chat_id'] = this.chatId;
    } else {
      json[r'chat_id'] = null;
    }
    if (this.segmentId != null) {
      json[r'segment_id'] = this.segmentId;
    } else {
      json[r'segment_id'] = null;
    }
      json[r'messages'] = this.messages;
    return json;
  }

  /// Returns a new [GetChatsByUserIDAndLectureID200ResponseInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetChatsByUserIDAndLectureID200ResponseInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetChatsByUserIDAndLectureID200ResponseInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetChatsByUserIDAndLectureID200ResponseInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetChatsByUserIDAndLectureID200ResponseInner(
        chatId: mapValueOfType<String>(json, r'chat_id'),
        segmentId: mapValueOfType<String>(json, r'segment_id'),
        messages: GetChatsByUserIDAndLectureID200ResponseInnerMessagesInner.listFromJson(json[r'messages']),
      );
    }
    return null;
  }

  static List<GetChatsByUserIDAndLectureID200ResponseInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetChatsByUserIDAndLectureID200ResponseInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetChatsByUserIDAndLectureID200ResponseInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetChatsByUserIDAndLectureID200ResponseInner> mapFromJson(dynamic json) {
    final map = <String, GetChatsByUserIDAndLectureID200ResponseInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetChatsByUserIDAndLectureID200ResponseInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetChatsByUserIDAndLectureID200ResponseInner-objects as value to a dart map
  static Map<String, List<GetChatsByUserIDAndLectureID200ResponseInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetChatsByUserIDAndLectureID200ResponseInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetChatsByUserIDAndLectureID200ResponseInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

