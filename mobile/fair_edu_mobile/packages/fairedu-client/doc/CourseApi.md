# openapi.api.CourseApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCoursesByStatus**](CourseApi.md#getcoursesbystatus) | **GET** /course/{user_id}/{status} | Get courses based on status (all, taking, finished)


# **getCoursesByStatus**
> List<GetCoursesByStatus200ResponseInner> getCoursesByStatus(userId, status)

Get courses based on status (all, taking, finished)

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CourseApi();
final userId = userId_example; // String | 
final status = status_example; // String | 

try {
    final result = api_instance.getCoursesByStatus(userId, status);
    print(result);
} catch (e) {
    print('Exception when calling CourseApi->getCoursesByStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **status** | **String**|  | 

### Return type

[**List<GetCoursesByStatus200ResponseInner>**](GetCoursesByStatus200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

