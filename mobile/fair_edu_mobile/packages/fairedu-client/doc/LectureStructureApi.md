# openapi.api.LectureStructureApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLectureStructure**](LectureStructureApi.md#getlecturestructure) | **GET** /structure/{lecture_id} | Get lecture structure


# **getLectureStructure**
> List<GetLectureStructure200ResponseInner> getLectureStructure(lectureId)

Get lecture structure

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = LectureStructureApi();
final lectureId = lectureId_example; // String | 

try {
    final result = api_instance.getLectureStructure(lectureId);
    print(result);
} catch (e) {
    print('Exception when calling LectureStructureApi->getLectureStructure: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **String**|  | 

### Return type

[**List<GetLectureStructure200ResponseInner>**](GetLectureStructure200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

