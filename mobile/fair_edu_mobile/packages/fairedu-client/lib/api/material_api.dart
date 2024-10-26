//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MaterialApi {
  MaterialApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get materials for lecture
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<Response> getMaterialsForLectureWithHttpInfo(String lectureId,) async {
    // ignore: prefer_const_declarations
    final path = r'/material/{lecture_id}'
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

  /// Get materials for lecture
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  Future<List<GetMaterialsForLecture200ResponseInner>?> getMaterialsForLecture(String lectureId,) async {
    final response = await getMaterialsForLectureWithHttpInfo(lectureId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetMaterialsForLecture200ResponseInner>') as List)
        .cast<GetMaterialsForLecture200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }

  /// Save material
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  ///
  /// * [String] userId (required):
  ///
  /// * [List<SaveMaterialRequestInner>] saveMaterialRequestInner (required):
  Future<Response> saveMaterialWithHttpInfo(String lectureId, String userId, List<SaveMaterialRequestInner> saveMaterialRequestInner,) async {
    // ignore: prefer_const_declarations
    final path = r'/material/{lecture_id}/{user_id}'
      .replaceAll('{lecture_id}', lectureId)
      .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = saveMaterialRequestInner;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Save material
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  ///
  /// * [String] userId (required):
  ///
  /// * [List<SaveMaterialRequestInner>] saveMaterialRequestInner (required):
  Future<void> saveMaterial(String lectureId, String userId, List<SaveMaterialRequestInner> saveMaterialRequestInner,) async {
    final response = await saveMaterialWithHttpInfo(lectureId, userId, saveMaterialRequestInner,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
