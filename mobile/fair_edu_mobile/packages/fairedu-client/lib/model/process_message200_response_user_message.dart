//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProcessMessage200ResponseUserMessage {
  /// Returns a new [ProcessMessage200ResponseUserMessage] instance.
  ProcessMessage200ResponseUserMessage({
    this.id,
    this.message,
    this.chatId,
    this.isUser,
    this.createdAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

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
  String? chatId;

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
  bool operator ==(Object other) => identical(this, other) || other is ProcessMessage200ResponseUserMessage &&
    other.id == id &&
    other.message == message &&
    other.chatId == chatId &&
    other.isUser == isUser &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (chatId == null ? 0 : chatId!.hashCode) +
    (isUser == null ? 0 : isUser!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() => 'ProcessMessage200ResponseUserMessage[id=$id, message=$message, chatId=$chatId, isUser=$isUser, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.chatId != null) {
      json[r'chat_id'] = this.chatId;
    } else {
      json[r'chat_id'] = null;
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

  /// Returns a new [ProcessMessage200ResponseUserMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProcessMessage200ResponseUserMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProcessMessage200ResponseUserMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProcessMessage200ResponseUserMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProcessMessage200ResponseUserMessage(
        id: mapValueOfType<String>(json, r'id'),
        message: mapValueOfType<String>(json, r'message'),
        chatId: mapValueOfType<String>(json, r'chat_id'),
        isUser: mapValueOfType<bool>(json, r'is_user'),
        createdAt: mapDateTime(json, r'created_at', r''),
      );
    }
    return null;
  }

  static List<ProcessMessage200ResponseUserMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProcessMessage200ResponseUserMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProcessMessage200ResponseUserMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProcessMessage200ResponseUserMessage> mapFromJson(dynamic json) {
    final map = <String, ProcessMessage200ResponseUserMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProcessMessage200ResponseUserMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProcessMessage200ResponseUserMessage-objects as value to a dart map
  static Map<String, List<ProcessMessage200ResponseUserMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProcessMessage200ResponseUserMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProcessMessage200ResponseUserMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

