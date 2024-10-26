//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ChatApi {
  ChatApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get chat IDs by user ID and lecture ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] lectureId (required):
  Future<Response> getChatsByUserIDAndLectureIDWithHttpInfo(String userId, String lectureId,) async {
    // ignore: prefer_const_declarations
    final path = r'/chats/{user_id}/{lecture_id}'
      .replaceAll('{user_id}', userId)
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

  /// Get chat IDs by user ID and lecture ID
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] lectureId (required):
  Future<List<GetChatsByUserIDAndLectureID200ResponseInner>?> getChatsByUserIDAndLectureID(String userId, String lectureId,) async {
    final response = await getChatsByUserIDAndLectureIDWithHttpInfo(userId, lectureId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetChatsByUserIDAndLectureID200ResponseInner>') as List)
        .cast<GetChatsByUserIDAndLectureID200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get chat messages
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] chatId (required):
  Future<Response> getMessagesByChatIDWithHttpInfo(String chatId,) async {
    // ignore: prefer_const_declarations
    final path = r'/messages/chat/{chat_id}'
      .replaceAll('{chat_id}', chatId);

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

  /// Get chat messages
  ///
  /// Parameters:
  ///
  /// * [String] chatId (required):
  Future<List<GetMessagesByChatID200ResponseInner>?> getMessagesByChatID(String chatId,) async {
    final response = await getMessagesByChatIDWithHttpInfo(chatId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GetMessagesByChatID200ResponseInner>') as List)
        .cast<GetMessagesByChatID200ResponseInner>()
        .toList(growable: false);

    }
    return null;
  }

  /// Send a chat message
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  ///
  /// * [String] userId (required):
  ///
  /// * [ProcessMessageRequest] processMessageRequest (required):
  Future<Response> processMessageWithHttpInfo(String lectureId, String userId, ProcessMessageRequest processMessageRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/message/{lecture_id}/{user_id}'
      .replaceAll('{lecture_id}', lectureId)
      .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = processMessageRequest;

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

  /// Send a chat message
  ///
  /// Parameters:
  ///
  /// * [String] lectureId (required):
  ///
  /// * [String] userId (required):
  ///
  /// * [ProcessMessageRequest] processMessageRequest (required):
  Future<ProcessMessage200Response?> processMessage(String lectureId, String userId, ProcessMessageRequest processMessageRequest,) async {
    final response = await processMessageWithHttpInfo(lectureId, userId, processMessageRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProcessMessage200Response',) as ProcessMessage200Response;
    
    }
    return null;
  }
}
