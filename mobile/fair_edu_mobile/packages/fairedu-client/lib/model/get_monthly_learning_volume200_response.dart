//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetMonthlyLearningVolume200Response {
  /// Returns a new [GetMonthlyLearningVolume200Response] instance.
  GetMonthlyLearningVolume200Response({
    this.lectures,
    this.courses,
    this.details = const [],
  });

  /// Number of lectures completed
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lectures;

  /// Number of courses completed
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? courses;

  List<GetMonthlyLearningVolume200ResponseDetailsInner> details;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetMonthlyLearningVolume200Response &&
    other.lectures == lectures &&
    other.courses == courses &&
    _deepEquality.equals(other.details, details);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lectures == null ? 0 : lectures!.hashCode) +
    (courses == null ? 0 : courses!.hashCode) +
    (details.hashCode);

  @override
  String toString() => 'GetMonthlyLearningVolume200Response[lectures=$lectures, courses=$courses, details=$details]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lectures != null) {
      json[r'lectures'] = this.lectures;
    } else {
      json[r'lectures'] = null;
    }
    if (this.courses != null) {
      json[r'courses'] = this.courses;
    } else {
      json[r'courses'] = null;
    }
      json[r'details'] = this.details;
    return json;
  }

  /// Returns a new [GetMonthlyLearningVolume200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetMonthlyLearningVolume200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetMonthlyLearningVolume200Response[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetMonthlyLearningVolume200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetMonthlyLearningVolume200Response(
        lectures: mapValueOfType<int>(json, r'lectures'),
        courses: mapValueOfType<int>(json, r'courses'),
        details: GetMonthlyLearningVolume200ResponseDetailsInner.listFromJson(json[r'details']),
      );
    }
    return null;
  }

  static List<GetMonthlyLearningVolume200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetMonthlyLearningVolume200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetMonthlyLearningVolume200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetMonthlyLearningVolume200Response> mapFromJson(dynamic json) {
    final map = <String, GetMonthlyLearningVolume200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetMonthlyLearningVolume200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetMonthlyLearningVolume200Response-objects as value to a dart map
  static Map<String, List<GetMonthlyLearningVolume200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetMonthlyLearningVolume200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetMonthlyLearningVolume200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

