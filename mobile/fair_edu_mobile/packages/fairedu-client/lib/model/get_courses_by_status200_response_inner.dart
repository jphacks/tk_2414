//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetCoursesByStatus200ResponseInner {
  /// Returns a new [GetCoursesByStatus200ResponseInner] instance.
  GetCoursesByStatus200ResponseInner({
    this.courseId,
    this.name,
    this.description,
    this.gradeId,
    this.subject,
    this.level,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? courseId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? gradeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? level;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetCoursesByStatus200ResponseInner &&
    other.courseId == courseId &&
    other.name == name &&
    other.description == description &&
    other.gradeId == gradeId &&
    other.subject == subject &&
    other.level == level;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (courseId == null ? 0 : courseId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (gradeId == null ? 0 : gradeId!.hashCode) +
    (subject == null ? 0 : subject!.hashCode) +
    (level == null ? 0 : level!.hashCode);

  @override
  String toString() => 'GetCoursesByStatus200ResponseInner[courseId=$courseId, name=$name, description=$description, gradeId=$gradeId, subject=$subject, level=$level]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.courseId != null) {
      json[r'course_id'] = this.courseId;
    } else {
      json[r'course_id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.gradeId != null) {
      json[r'grade_id'] = this.gradeId;
    } else {
      json[r'grade_id'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.level != null) {
      json[r'level'] = this.level;
    } else {
      json[r'level'] = null;
    }
    return json;
  }

  /// Returns a new [GetCoursesByStatus200ResponseInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetCoursesByStatus200ResponseInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetCoursesByStatus200ResponseInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetCoursesByStatus200ResponseInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetCoursesByStatus200ResponseInner(
        courseId: mapValueOfType<String>(json, r'course_id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        gradeId: mapValueOfType<String>(json, r'grade_id'),
        subject: mapValueOfType<String>(json, r'subject'),
        level: mapValueOfType<String>(json, r'level'),
      );
    }
    return null;
  }

  static List<GetCoursesByStatus200ResponseInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetCoursesByStatus200ResponseInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetCoursesByStatus200ResponseInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetCoursesByStatus200ResponseInner> mapFromJson(dynamic json) {
    final map = <String, GetCoursesByStatus200ResponseInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetCoursesByStatus200ResponseInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetCoursesByStatus200ResponseInner-objects as value to a dart map
  static Map<String, List<GetCoursesByStatus200ResponseInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetCoursesByStatus200ResponseInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetCoursesByStatus200ResponseInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

