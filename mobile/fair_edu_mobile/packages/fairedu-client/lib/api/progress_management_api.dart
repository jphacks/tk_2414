//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProgressManagementApi {
  ProgressManagementApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Display progress for ongoing courses
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  Future<Response> displayOngoingProgressWithHttpInfo(String userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/progress/{user_id}'
      .replaceAll('{user_id}', userId);

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

  /// Display progress for ongoing courses
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  Future<List<DisplayOngoingProgress200ResponseInner>?> displayOngoingProgress(String userId,) async {
    final response = await displayOngoingProgressWithHttpInfo(userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<DisplayOngoingProgress200ResponseInner>') as List)
        .cast<DisplayOngoingProgress200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }

  /// Calculate and return the learning volume for the month
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] month (required):
  Future<Response> getMonthlyLearningVolumeWithHttpInfo(String userId, String month,) async {
    // ignore: prefer_const_declarations
    final path = r'/progress/{user_id}/{month}'
      .replaceAll('{user_id}', userId)
      .replaceAll('{month}', month);

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

  /// Calculate and return the learning volume for the month
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] month (required):
  Future<GetMonthlyLearningVolume200Response?> getMonthlyLearningVolume(String userId, String month,) async {
    final response = await getMonthlyLearningVolumeWithHttpInfo(userId, month,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetMonthlyLearningVolume200Response',) as GetMonthlyLearningVolume200Response;
    
    }
    return null;
  }

  /// Register progress for a lecture
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RegisterProgressRequest] registerProgressRequest (required):
  Future<Response> registerProgressWithHttpInfo(RegisterProgressRequest registerProgressRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/progress';

    // ignore: prefer_final_locals
    Object? postBody = registerProgressRequest;

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

  /// Register progress for a lecture
  ///
  /// Parameters:
  ///
  /// * [RegisterProgressRequest] registerProgressRequest (required):
  Future<void> registerProgress(RegisterProgressRequest registerProgressRequest,) async {
    final response = await registerProgressWithHttpInfo(registerProgressRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
