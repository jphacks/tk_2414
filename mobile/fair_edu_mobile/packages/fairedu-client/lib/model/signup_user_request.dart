//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignupUserRequest {
  /// Returns a new [SignupUserRequest] instance.
  SignupUserRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;

  String email;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SignupUserRequest &&
    other.name == name &&
    other.email == email &&
    other.password == password;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (email.hashCode) +
    (password.hashCode);

  @override
  String toString() => 'SignupUserRequest[name=$name, email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'email'] = this.email;
      json[r'password'] = this.password;
    return json;
  }

  /// Returns a new [SignupUserRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignupUserRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SignupUserRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SignupUserRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignupUserRequest(
        name: mapValueOfType<String>(json, r'name')!,
        email: mapValueOfType<String>(json, r'email')!,
        password: mapValueOfType<String>(json, r'password')!,
      );
    }
    return null;
  }

  static List<SignupUserRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SignupUserRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignupUserRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignupUserRequest> mapFromJson(dynamic json) {
    final map = <String, SignupUserRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignupUserRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignupUserRequest-objects as value to a dart map
  static Map<String, List<SignupUserRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SignupUserRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SignupUserRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'email',
    'password',
  };
}

