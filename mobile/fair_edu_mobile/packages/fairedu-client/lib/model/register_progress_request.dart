//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RegisterProgressRequest {
  /// Returns a new [RegisterProgressRequest] instance.
  RegisterProgressRequest({
    this.lectureId,
    this.userId,
  });

  /// ID of the lecture
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lectureId;

  /// ID of the user
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterProgressRequest &&
    other.lectureId == lectureId &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lectureId == null ? 0 : lectureId!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'RegisterProgressRequest[lectureId=$lectureId, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lectureId != null) {
      json[r'lecture_id'] = this.lectureId;
    } else {
      json[r'lecture_id'] = null;
    }
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    return json;
  }

  /// Returns a new [RegisterProgressRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegisterProgressRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegisterProgressRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegisterProgressRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegisterProgressRequest(
        lectureId: mapValueOfType<String>(json, r'lecture_id'),
        userId: mapValueOfType<String>(json, r'user_id'),
      );
    }
    return null;
  }

  static List<RegisterProgressRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegisterProgressRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegisterProgressRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegisterProgressRequest> mapFromJson(dynamic json) {
    final map = <String, RegisterProgressRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterProgressRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegisterProgressRequest-objects as value to a dart map
  static Map<String, List<RegisterProgressRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegisterProgressRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RegisterProgressRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

