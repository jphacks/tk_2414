//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetMaterialsForLecture200ResponseInner {
  /// Returns a new [GetMaterialsForLecture200ResponseInner] instance.
  GetMaterialsForLecture200ResponseInner({
    this.segmentId,
    this.voice,
    this.content,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? segmentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? voice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetMaterialsForLecture200ResponseInner &&
    other.segmentId == segmentId &&
    other.voice == voice &&
    other.content == content;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (segmentId == null ? 0 : segmentId!.hashCode) +
    (voice == null ? 0 : voice!.hashCode) +
    (content == null ? 0 : content!.hashCode);

  @override
  String toString() => 'GetMaterialsForLecture200ResponseInner[segmentId=$segmentId, voice=$voice, content=$content]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.segmentId != null) {
      json[r'segment_id'] = this.segmentId;
    } else {
      json[r'segment_id'] = null;
    }
    if (this.voice != null) {
      json[r'voice'] = this.voice;
    } else {
      json[r'voice'] = null;
    }
    if (this.content != null) {
      json[r'content'] = this.content;
    } else {
      json[r'content'] = null;
    }
    return json;
  }

  /// Returns a new [GetMaterialsForLecture200ResponseInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetMaterialsForLecture200ResponseInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetMaterialsForLecture200ResponseInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetMaterialsForLecture200ResponseInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetMaterialsForLecture200ResponseInner(
        segmentId: mapValueOfType<String>(json, r'segment_id'),
        voice: mapValueOfType<String>(json, r'voice'),
        content: mapValueOfType<String>(json, r'content'),
      );
    }
    return null;
  }

  static List<GetMaterialsForLecture200ResponseInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetMaterialsForLecture200ResponseInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetMaterialsForLecture200ResponseInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetMaterialsForLecture200ResponseInner> mapFromJson(dynamic json) {
    final map = <String, GetMaterialsForLecture200ResponseInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetMaterialsForLecture200ResponseInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetMaterialsForLecture200ResponseInner-objects as value to a dart map
  static Map<String, List<GetMaterialsForLecture200ResponseInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetMaterialsForLecture200ResponseInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetMaterialsForLecture200ResponseInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

