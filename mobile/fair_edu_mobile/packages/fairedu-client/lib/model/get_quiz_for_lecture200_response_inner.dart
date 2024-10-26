//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetQuizForLecture200ResponseInner {
  /// Returns a new [GetQuizForLecture200ResponseInner] instance.
  GetQuizForLecture200ResponseInner({
    this.text,
    this.choices = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? text;

  List<GetQuizForLecture200ResponseInnerChoicesInner> choices;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetQuizForLecture200ResponseInner &&
    other.text == text &&
    _deepEquality.equals(other.choices, choices);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (text == null ? 0 : text!.hashCode) +
    (choices.hashCode);

  @override
  String toString() => 'GetQuizForLecture200ResponseInner[text=$text, choices=$choices]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.text != null) {
      json[r'text'] = this.text;
    } else {
      json[r'text'] = null;
    }
      json[r'choices'] = this.choices;
    return json;
  }

  /// Returns a new [GetQuizForLecture200ResponseInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetQuizForLecture200ResponseInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetQuizForLecture200ResponseInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetQuizForLecture200ResponseInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetQuizForLecture200ResponseInner(
        text: mapValueOfType<String>(json, r'text'),
        choices: GetQuizForLecture200ResponseInnerChoicesInner.listFromJson(json[r'choices']),
      );
    }
    return null;
  }

  static List<GetQuizForLecture200ResponseInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetQuizForLecture200ResponseInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetQuizForLecture200ResponseInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetQuizForLecture200ResponseInner> mapFromJson(dynamic json) {
    final map = <String, GetQuizForLecture200ResponseInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetQuizForLecture200ResponseInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetQuizForLecture200ResponseInner-objects as value to a dart map
  static Map<String, List<GetQuizForLecture200ResponseInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetQuizForLecture200ResponseInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetQuizForLecture200ResponseInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

