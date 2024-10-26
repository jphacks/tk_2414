# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getChatsByUserIDAndLectureID**](ChatApi.md#getchatsbyuseridandlectureid) | **GET** /chats/{user_id}/{lecture_id} | Get chat IDs by user ID and lecture ID
[**getMessagesByChatID**](ChatApi.md#getmessagesbychatid) | **GET** /messages/chat/{chat_id} | Get chat messages
[**processMessage**](ChatApi.md#processmessage) | **POST** /message/{lecture_id}/{user_id} | Send a chat message


# **getChatsByUserIDAndLectureID**
> List<GetChatsByUserIDAndLectureID200ResponseInner> getChatsByUserIDAndLectureID(userId, lectureId)

Get chat IDs by user ID and lecture ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final userId = userId_example; // String | 
final lectureId = lectureId_example; // String | 

try {
    final result = api_instance.getChatsByUserIDAndLectureID(userId, lectureId);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->getChatsByUserIDAndLectureID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **lectureId** | **String**|  | 

### Return type

[**List<GetChatsByUserIDAndLectureID200ResponseInner>**](GetChatsByUserIDAndLectureID200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMessagesByChatID**
> List<GetMessagesByChatID200ResponseInner> getMessagesByChatID(chatId)

Get chat messages

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final chatId = chatId_example; // String | 

try {
    final result = api_instance.getMessagesByChatID(chatId);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->getMessagesByChatID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatId** | **String**|  | 

### Return type

[**List<GetMessagesByChatID200ResponseInner>**](GetMessagesByChatID200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processMessage**
> ProcessMessage200Response processMessage(lectureId, userId, processMessageRequest)

Send a chat message

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final lectureId = lectureId_example; // String | 
final userId = userId_example; // String | 
final processMessageRequest = ProcessMessageRequest(); // ProcessMessageRequest | 

try {
    final result = api_instance.processMessage(lectureId, userId, processMessageRequest);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->processMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **String**|  | 
 **userId** | **String**|  | 
 **processMessageRequest** | [**ProcessMessageRequest**](ProcessMessageRequest.md)|  | 

### Return type

[**ProcessMessage200Response**](ProcessMessage200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

