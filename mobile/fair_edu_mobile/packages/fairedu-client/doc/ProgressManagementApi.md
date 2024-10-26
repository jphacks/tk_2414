# openapi.api.ProgressManagementApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**displayOngoingProgress**](ProgressManagementApi.md#displayongoingprogress) | **GET** /progress/{user_id} | Display progress for ongoing courses
[**getMonthlyLearningVolume**](ProgressManagementApi.md#getmonthlylearningvolume) | **GET** /progress/{user_id}/{month} | Calculate and return the learning volume for the month
[**registerProgress**](ProgressManagementApi.md#registerprogress) | **POST** /progress | Register progress for a lecture


# **displayOngoingProgress**
> List<DisplayOngoingProgress200ResponseInner> displayOngoingProgress(userId)

Display progress for ongoing courses

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ProgressManagementApi();
final userId = userId_example; // String | 

try {
    final result = api_instance.displayOngoingProgress(userId);
    print(result);
} catch (e) {
    print('Exception when calling ProgressManagementApi->displayOngoingProgress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**List<DisplayOngoingProgress200ResponseInner>**](DisplayOngoingProgress200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMonthlyLearningVolume**
> GetMonthlyLearningVolume200Response getMonthlyLearningVolume(userId, month)

Calculate and return the learning volume for the month

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ProgressManagementApi();
final userId = userId_example; // String | 
final month = month_example; // String | 

try {
    final result = api_instance.getMonthlyLearningVolume(userId, month);
    print(result);
} catch (e) {
    print('Exception when calling ProgressManagementApi->getMonthlyLearningVolume: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **month** | **String**|  | 

### Return type

[**GetMonthlyLearningVolume200Response**](GetMonthlyLearningVolume200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerProgress**
> registerProgress(registerProgressRequest)

Register progress for a lecture

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ProgressManagementApi();
final registerProgressRequest = RegisterProgressRequest(); // RegisterProgressRequest | 

try {
    api_instance.registerProgress(registerProgressRequest);
} catch (e) {
    print('Exception when calling ProgressManagementApi->registerProgress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerProgressRequest** | [**RegisterProgressRequest**](RegisterProgressRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

