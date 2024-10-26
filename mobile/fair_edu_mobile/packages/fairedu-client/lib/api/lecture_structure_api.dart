//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LectureStructureApi {
  LectureStructureApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get lecture structure
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<Response> getLectureStructureWithHttpInfo(String lectureId,) async {
    // ignore: prefer_const_declarations
    final path = r'/structure/{lecture_id}'
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

  /// Get lecture structure
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<List<GetLectureStructure200ResponseInner>?> getLectureStructure(String lectureId,) async {
    final response = await getLectureStructureWithHttpInfo(lectureId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetLectureStructure200ResponseInner>') as List)
        .cast<GetLectureStructure200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }
}
