//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LectureApi {
  LectureApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get lectures for a course
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] courseId (required):
  Future<Response> getLecturesForCourseWithHttpInfo(String courseId,) async {
    // ignore: prefer_const_declarations
    final path = r'/lectures/{course_id}'
      .replaceAll('{course_id}', courseId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get lectures for a course
  ///
  /// Parameters:
  ///
  /// * [String] courseId (required):
  Future<List<GetLecturesForCourse200ResponseInner>?> getLecturesForCourse(String courseId,) async {
    final response = await getLecturesForCourseWithHttpInfo(courseId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetLecturesForCourse200ResponseInner>') as List)
        .cast<GetLecturesForCourse200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get quiz for a lecture
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<Response> getQuizForLectureWithHttpInfo(String lectureId,) async {
    // ignore: prefer_const_declarations
    final path = r'/test/{lecture_id}'
      .replaceAll('{lecture_id}', lectureId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get quiz for a lecture
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<List<GetQuizForLecture200ResponseInner>?> getQuizForLecture(String lectureId,) async {
    final response = await getQuizForLectureWithHttpInfo(lectureId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetQuizForLecture200ResponseInner>') as List)
        .cast<GetQuizForLecture200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }
}
